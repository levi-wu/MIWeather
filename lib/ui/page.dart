import 'package:flutter/material.dart';
import 'package:weather/data/repository.dart';
import 'package:weather/ui/forecast_hour.dart';
import 'package:weather/util/weather_convert.dart';

const int cloudyBg = 0xff8592ba;
const int sunnyBg = 0xff5e8fe9;
const int sunnyDecorBg = 0xff6d9cee;
const int sunnyDecorAirBg = 0xff86aff1;
const double borderRadius = 15.0;
const double borderAirRadius = 3.0;
const double fontSize = 16.0;

class PageViewHome extends StatefulWidget {
  final AnimationController _animController;
  final ScrollController _controller;
  final int index;

  PageViewHome(this._animController, this._controller, {this.index});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageViewHomeState();
  }
}

class _PageViewHomeState extends State<PageViewHome> {
  /// data库
  Repository _repository;

  @override
  Widget build(BuildContext context) {
    _repository = Repository.of(context);
    MediaQueryData data = MediaQuery.of(context);

    ThemeData themeData = Theme.of(context);
    TextTheme appBarText = themeData.appBarTheme.textTheme;
    TextStyle textStyle =
        appBarText?.title ?? themeData.primaryTextTheme.subhead
          ..copyWith(color: Colors.white);

    // TODO: implement build
    return Container(
        color: Color(sunnyBg),
        child: SingleChildScrollView(
          controller: widget._controller,
          child: Stack(
            children: <Widget>[
              // bg
              Image.asset("images/2.0x/bg_scrollview_middle_layer_sunny.png"),
              Image.asset("images/2.0x/sunny_bg_high_light.png",
                  width: data.size.height),
              // bg sun
              Positioned(
                left: data.size.width - 65.0 * 2,
                top: 56.0,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
//                    Image.asset(
//                      "images/2.0x/sunny_bg_sun.png",
//                      width: 65.0 + 20,
//                      height: 65.0 + 20,
//                    ),
                    Image.asset(
                      "images/2.0x/icon_gray_bg_sunny.png",
                      width: 65.0,
                      height: 65.0,
                    ),
                  ],
                ),
              ),
              // data
              Positioned(
                  top: kToolbarHeight + 24.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${_repository.hourInfo.current.temperature.value}",
                              style: textStyle.copyWith(
                                  fontSize: 80.0,
                                  fontFamily: "Temperature"),
                            ),
                            Text(
                                "${_repository.hourInfo.current.temperature.unit}",
                                style: textStyle),
                          ],
                        ),
                        Text(
                            "${WeatherConvert.getWeatherName(int.parse(_repository.hourInfo.current.weather))}",
                            style: textStyle),
                      ],
                    ),
                  )),

              _HomeView1(widget._animController),
            ],
          ),
        ));
  }
}

class _HomeView1 extends StatefulWidget {
  final AnimationController _animController;

  _HomeView1(this._animController);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeView1State();
  }
}

class _HomeView1State extends State<_HomeView1> {
  Repository _repository;
  TextStyle textStyle;
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme appBarText = themeData.appBarTheme.textTheme;
    textStyle = appBarText?.title ?? themeData.primaryTextTheme.subhead
      ..copyWith(color: Colors.white);
    // 数据
    _repository = Repository.of(context);

    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 56.0 + 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 大风降雨预警

          // 降水view

          // aqi & 降雨信息 & 15天天气信息
          _buildAqi(),

          Container(
              height: queryData.size.height,
              margin: EdgeInsets.only(top: 16),
              child: Column(
                children: <Widget>[
                  ForecastHour(repository: _repository),
                ],
              )),

          // 24小时预报

          // 日出日落，其他指数，气压等
          // video
          // 资讯
          // 生活指数
        ],
      ),
    );
  }

  /// aqi
  int get aqi => int.parse(_repository.hourInfo.aqi.aqi);

  String get aqiStr => WeatherConvert.getHeadAqi(aqi);

  /// data
  String get rainWarn => _repository.rainfall.precipitation.headDescription;

  String get rainWarnType => _repository.rainfall.precipitation.headIconType;

  /// 构建aqi & 降雨信息 & 15天天气信息
  Widget _buildAqi() {
    // sun width
    Animation<RelativeRect> _anim = RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, 0),
            end: RelativeRect.fromLTRB(0, 55, 0, -55))
        .animate(widget._animController);

    // 天气信息
    Widget aqiWidget = SizedBox(
      height: queryData.size.height - (56.0 + 24.0),
      child: Stack(
        children: <Widget>[
          PositionedTransition(
            rect: _anim,
            child: Column(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(top: queryData.size.height * .5 - 56.0),
                  height: 16,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: null,
                          icon: Image.asset(WeatherConvert.getAqiIcon(aqi)),
                          label: Text("$aqiStr $aqi", style: textStyle),
                          disabledTextColor: Colors.white,
                        ),
                      ),
                      VerticalDivider(color: Colors.white),
                      Expanded(
                        child: FlatButton.icon(
                          onPressed: null,
                          icon: Image.asset(
                              WeatherConvert.getRainIcon(rainWarnType)),
                          label: Text("$rainWarn", style: textStyle),
                          disabledTextColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 56.0 * .5),
                ),
                // 15天天气信息
                Expanded(child: FifteenWeatherView(_repository)),
              ],
            ),
//                ),
          )
        ],
      ),
    );

    return aqiWidget;
  }
}

class FifteenWeatherView extends StatelessWidget {
  final Repository _repository;

  FifteenWeatherView(this._repository);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 数据
    ThemeData themeData = Theme.of(context);
    TextStyle style = themeData.textTheme.body1.copyWith(color: Colors.white);

    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Color(sunnyDecorBg),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: items[0],
          ),
          Divider(),
          Expanded(
            flex: 2,
            child: items[1],
          ),
          Divider(),
          Expanded(
            flex: 2,
            child: items[2],
          ),
          Divider(),
          Expanded(
            flex: 1,
            child: Center(
              child: Text("$forecastSize天趋势预报", style: style),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get items {
    var daily = _repository.hourInfo.forecastDaily;
    return List<Widget>.generate(3, (index) {
      return _FifteenWeatherViewItem(
        weather: WeatherConvert.getFifteenItemsName(daily, index),
        air: aqiStr,
        image: WeatherConvert.getFifteenItemsIcon(daily, index),
        centigrade:
            WeatherConvert.getFifteenItemsTemper(daily.temperature, index),
      );
    });
  }

  /// aqi
  int get aqi => int.parse(_repository.hourInfo.aqi.aqi);

  String get aqiStr => WeatherConvert.getAqi(aqi);

  int get forecastSize =>
      _repository.hourInfo.forecastDaily.weather.value.length;
}

class _FifteenWeatherViewItem extends StatelessWidget {
  final String weather;
  final String air;
  final String image;
  final String centigrade;

  _FifteenWeatherViewItem(
      {this.weather = "今天 · 晴",
      this.air = "良",
      this.image = "images/icon_sunny.png",
      this.centigrade = "17 / 11℃"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData themeData = Theme.of(context);
    TextStyle styleSmall = themeData.textTheme.caption
        .copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    TextTheme appBarText = themeData.appBarTheme.textTheme;
    TextStyle textStyle =
        appBarText?.title ?? themeData.primaryTextTheme.subhead
          ..copyWith(color: Colors.white);
    return Container(
      padding: EdgeInsets.all(6.0),
      height: 40,
      child: Row(
        children: <Widget>[
          Text("$weather", style: textStyle),
          Container(
            decoration: BoxDecoration(
                color: Color(sunnyDecorAirBg),
                borderRadius:
                    BorderRadius.all(Radius.circular(borderAirRadius))),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
            margin: EdgeInsets.only(left: 3.0),
            child: Text("$air", style: styleSmall),
          ),
          Expanded(
            child: Padding(padding: EdgeInsets.all(0.0)),
          ),
          Image.asset(
            "$image",
            width: 25,
          ),
          Padding(padding: EdgeInsets.only(left: 6.0)),
          Text(
            "$centigrade",
            style: textStyle,
          )
        ],
      ),
    );
  }
}
