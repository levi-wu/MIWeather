import 'dart:async';

import 'package:flutter/material.dart';

/// 刷新完成状态
enum RefreshStatus { drag, refresh, complete }

typedef RefreshFuc<T> = Future<T> Function();

/// 刷新的监听
typedef Drag = void Function();
typedef Refresh<T> = Future<T> Function();
typedef Complete = void Function();

/// refresh view刷新，帧动画
class RefreshView extends StatefulWidget {
  final RefreshStatus status;
  final Drag drag;
  final Refresh refresh;
  final Complete complete;
  final String text; // 说明信息

  RefreshView(
      {this.text,
      this.drag,
      this.refresh,
      this.complete,
      this.status = RefreshStatus.drag});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RefreshViewState();
  }
}

class RefreshViewState extends State<RefreshView>
    with SingleTickerProviderStateMixin {
  String path = "images/refresh_cloud_shape_0.png";
  String pathPrefix = "images/refresh_cloud_shape_";
  String pathSuffix = ".png";
  int imgIndex = 15;
  int pathNum = 0;
  List<String> text = ["刚刚更新", "正在更新", "更新完成", "数据过期"];
  String current;

  // 更新动画
  AnimationController _controller;
  Animation<Offset> _animation;
  RefreshStatus _status;

  // 保存刷新时间
  DateTime _dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 移动动画
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    _animation = new Tween<Offset>(begin: Offset(.0, .0), end: Offset(0.2, 0))
        .animate(_controller);

    _status = widget.status;

    _dateTime = DateTime.now();
  }

  /// 状态更新动画
  process() async {
    _status = widget.status;
    if (_status == RefreshStatus.drag) {
      // 正在更新，16分钟前更新
      DateTime curr = new DateTime.now();
      Duration duration = curr.difference(_dateTime);
      if (duration.inMinutes > 1 && duration.inMinutes < 60) {
        current = "${duration.inMinutes}分钟前更新";
      } else if (duration.inMinutes >= 60) {
        current = text[3];
      } else {
        current = text[0];
      }
      pathNum = 0;
      dragAnim();
    } else if (_status == RefreshStatus.refresh) {
      // 刷新
      current = text[1];
      refreshAnim();
    } else if (_status == RefreshStatus.complete) {
      // 更新完成
      current = text[2];
      finishAnim();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  /// 开始动画，更新完成
  void finishAnim() {
    Timer.periodic(Duration(milliseconds: 100), (t) {
      if (pathNum >= imgIndex) {
        t.cancel();
        widget.complete();
      } else {
        setState(() {
          pathNum++;
        });
      }
    });
  }

  /// 下拉，显示透明度动画，隐藏Appbar
  void dragAnim() {
    if (widget.drag != null) {
      widget.drag();
    }
    _controller.repeat(reverse: true);
  }

  /// 正在更新，左右移动动画
  refreshAnim() async {
    if (widget.refresh != null) {
      await widget.refresh();
      _dateTime = DateTime.now();
    }
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle style =
        Theme.of(context).textTheme.caption.copyWith(color: Colors.white);

    // 状态更新动画
    process();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SlideTransition(
          position: _animation,
          child: Image.asset(
            "$pathPrefix$pathNum$pathSuffix",
            width: 16,
            gaplessPlayback: true,
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 6)),
        Text(
          widget.text ?? current,
          style: style,
        ),
      ],
    );
  }
}
