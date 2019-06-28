import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/data/model/cache.dart';
import 'package:weather/data/repository.dart';
import 'package:weather/net/http.dart';
import 'package:weather/ui/app_bar.dart';
import 'package:weather/ui/page.dart';
import 'package:weather/ui/page_indicator.dart';
import 'package:weather/ui/refresh_widget.dart';

class WeatherHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WeatherHomeState();
  }
}

class _WeatherHomeState extends State<WeatherHome>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  ScrollController _controller;
  AnimationController _animController;
  PageController _pageController;
  bool isVisible = true; // app bar
  bool isTransparent = true; // app bar background
  bool isScroll = false;
  double height;

  /// 下拉刷新高度
  Offset initDownX;
  Duration initDuration;
  RefreshStatus _status = RefreshStatus.drag;

  /// data库
  Repository _repository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化
    init();
    initPageIndex();
    initScrollBehaviour();
  }

  /// 初始化数据
  void init() {
    _controller = new ScrollController();
    _pageController = new PageController();
    _animController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    // 生命周期
    WidgetsBinding.instance.addObserver(this);
    // 页面竖屏固定
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // 刷新数据
    refresh();
  }

  /// 初始化页面数据,更新index值
  void initPageIndex() {
    _pageController.addListener(() {
      print("page:${_pageController.page}");
      print("page int:${_pageController.page.toInt()}");

      var index = _repository.index;
      var page = _pageController.page.toInt();
      // 避免每次滑动都要进行index的更新
      if (page == index + 1) {
        _repository.indexInc();
        refresh();
      } else if (index != 0 && page == index - 1) {
        _repository.indexDec();
        refresh();
      }
    });
  }

  /// 初始化滑动的行为
  void initScrollBehaviour() {
    var y = 0.0;
    var delY;
    _controller.addListener(() {
      delY = _controller.offset - y;
      // 上滑动 显示 下滑 隐藏
      if (delY > 0 && isVisible) {
        setState(() {
          isVisible = false;
        });
      } else if (delY < 0 && !isVisible) {
        setState(() {
          isVisible = true;
        });
      }

      y = _controller.offset;

      // 滑动超过一般高，自动下滑。
      if (_controller.offset > height / 2 && !isScroll) {
        isScroll = true;
        _controller.animateTo(height,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else if (_controller.offset < height / 2 && isScroll) {
        isScroll = false;
      }

      // 控制颜色
      if (_controller.offset > height / 2 && isTransparent) {
        setState(() {
          isTransparent = false;
        });
      } else if (_controller.offset < height / 2 && !isTransparent) {
        setState(() {
          isTransparent = true;
        });
      }

      // 滑动动画中断
      if (delY > 0) {
        _animController.reset();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 刷新
    print("lifecycle: ${state.toString()}");
    if (state == AppLifecycleState.resumed) {
      refresh();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _pageController.dispose();
    _animController.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _repository = Repository.of(context);
    height = MediaQuery.of(context).size.height;

    Widget home = Listener(
      onPointerMove: dragMove,
      onPointerDown: dragDown,
      onPointerUp: dragUp,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: _repository.length,
            itemBuilder: _buildPageViews,
          ),
          // app bar
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: isVisible ? 1.0 : 0.0,
            child: MyAppBar(
              colors: isTransparent ? Colors.transparent : Colors.blue,
              leading: IconButton(
                tooltip: "添加城市",
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${_repository.city.data[0].name}"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: _buildPageRefreshIndicator(),
                  )
                ],
              ),
              tailing: IconButton(
                tooltip: "更多",
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () async {},
              ),
            ),
          ),
        ],
      ),
    );

    // 拦截事件，当刷新的时候
    return IgnorePointer(
      child: home,
      ignoring: _status == RefreshStatus.refresh,
    );
  }

  /// pageView indicator & refresh view
  Widget _buildPageRefreshIndicator() {
    Animation<double> animation =
        new Tween(begin: 0.0, end: 1.0).animate(_animController);
    Animation<double> reverseAnim = new ReverseAnimation(animation);

    // 刷新
    Future _refresh() async {
      await _repository.refresh().whenComplete(() {
        setState(() {
          _status = RefreshStatus.complete;
        });
      });
    }

    // 完成
    void _complete() {
      _dragUp();
    }

    return Stack(
      children: <Widget>[
        FadeTransition(
          opacity: animation,
          child: RefreshView(
              refresh: _refresh, complete: _complete, status: _status),
        ),
        FadeTransition(
          opacity: reverseAnim,
          child: PageIndicator(_repository.length, _pageController),
        ),
      ],
    );
  }

  /// page views 页面
  Widget _buildPageViews(BuildContext context, int index) {
    var widgets = List<Widget>.generate(_repository.length, (index) {
      return PageViewHome(_animController, _controller);
    });

    return widgets[index];
  }

  /// 下拉刷新
  void dragMove(PointerMoveEvent e) {
    if (_animController.isAnimating ||
        _animController.status == AnimationStatus.completed) return;
    // 只能在起始处动画
    if (initDownX == null) return;
    // 正在刷新的时候，不执行刷新。
//    if (_status == RefreshStatus.refresh) return;

    if (_controller.offset == 0 && _controller.position.maxScrollExtent > 0) {
      Offset deltaOffset = e.position - initDownX;
      Duration duration = e.timeStamp - initDuration;
      double velocity = deltaOffset.dy / duration.inMilliseconds;
      if (velocity > 1.0) {
        _animController.fling(velocity: 2.0).whenComplete(() {
          setState(() {
            _status = RefreshStatus.refresh;
          });
        });
      } else {
        _animController.value = deltaOffset.dy * .2 / 55;
      }
    }
  }

  void dragDown(PointerDownEvent e) {
    if (_controller.offset == 0 && _controller.position.maxScrollExtent > 0) {
      initDownX = e.position;
      initDuration = e.timeStamp;
    } else {
      initDownX = null;
    }
  }

  void dragUp(PointerUpEvent e) {
    if (_animController.value >= 1.0) {
      setState(() {
        _status = RefreshStatus.refresh;
      });
    } else if (_animController.value < 1.0) {
      _dragUp();
    }
  }

  void _dragUp() {
    if (_animController.isAnimating) return;
    _animController.fling(velocity: -2.0).whenComplete(() {
      setState(() {
        _status = RefreshStatus.drag;
      });
    });
  }

  /// 手动刷新，首次进入
  void refresh() async {
    await Future.delayed(Duration(microseconds: 0), () {
      return _repository?.hourInfo?.updateTime != null;
    });
    var pubTimeStamp = _repository?.hourInfo?.updateTime;
    if (pubTimeStamp != null) {
      var curr = DateTime.now();
      var pubTime = DateTime.fromMillisecondsSinceEpoch(pubTimeStamp);
      // 15分钟刷新一次
      if (curr.difference(pubTime).inMinutes > 15) {
        setState(() {
          _status = RefreshStatus.refresh;
          _animController.value = 1.0; // 开启动画效果
        });
      }
    }
  }
}
