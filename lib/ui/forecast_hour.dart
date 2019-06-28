import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:weather/data/bean/forecast_24.dart';
import 'package:weather/data/repository.dart';
import 'package:weather/ui/page.dart';
import 'package:weather/util/image.dart';
import 'package:weather/util/weather_convert.dart';

/// 绘制24h折线图
class ForecastHour extends StatefulWidget {
  final Repository repository;

  const ForecastHour({Key key, this.repository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForecastHourState();
  }
}

class _ForecastHourState extends State<ForecastHour> {
  Repository _repository;

  /// 50 * (27 -1) + 16 * 2,x轴之间的距离加边距
  double canvasWidth = (60.0 * (26 - 1) + 25 * 2);
  var size;

  Forecast24 forecast;
  Map<String, ui.Image> maps;

  ScrollController controller;
  double scrollX = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository = widget.repository;
    controller = new ScrollController()
      ..addListener(() {
        if (mounted) {
          setState(() {
            scrollX = controller.offset;
          });
        }
      });

    // 数据更新，更新forecast
    _repository.addListener(() {
//      if (mounted) {
//        setState(() {
          initData();
//        });
//      }
    });

    initData();
  }

  /// 初始化数据
  initData() {
    maps = null;
    forecast = WeatherConvert.getForecast24(_repository);
    canvasWidth = (60.0 * (forecast.num - 1) + 25 * 2);
    // 图片地址对应的 url => ui.images
    var weaSet = forecast.icons.toSet();
    var windSet = forecast.windDirection.toSet();

    var imagesKey = Set<String>();
    imagesKey..addAll(windSet)..addAll(weaSet);
    ImageUtils.getImages(imagesKey).then((imgList) {
      maps = Map.fromIterables(imagesKey, imgList);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // TODO: implement build
    return Container(
      width: size.width,
      height: size.height * .4,
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xff6d9cee),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        children: <Widget>[
          Text("24小时预报", style: TextStyle(fontSize: 16, color: Colors.white)),
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  child: maps != null
                      ? RepaintBoundary(
                          child: CustomPaint(
                            size: Size(canvasWidth, size.height * .4),
                            painter: ForecastHourPainter(
                                forecast, maps, scrollX, size.width),
                          ),
                        )
                      : CircularProgressIndicator())),
        ],
      ),
    );
  }
}

class ForecastHourPainter extends CustomPainter {
  /// 图片地址 => ui.image
  final Map<String, ui.Image> maps;
  final Forecast24 forecast24;

  /// 滑动的画布距离
  double scrollX;

  /// 屏幕宽
  double screenWidth;

  ForecastHourPainter(
      this.forecast24, this.maps, this.scrollX, this.screenWidth);

  /// 数据 24h + 前一h + 日出日落
  int num = 26;

  /// x轴之间的距离
  double xInterval = 60.0;

  /// x,y坐标的初始值，padding
  double xAxis = 24.0;
  double yAxis = 24.0;

  /// text的高
  double textHeight = 16.0;

  /// view之间的margin
  double margin = 8.0;

  /// aqi
  double aqiHeight = 16.0;
  double aqiWidth = 24.0 * 2;

  /// 折线的高度
  double foldLineHeight = 50;
  double foldLinePart = 4.0;
  double foldLineDash = 2.0;

  /// 天气的圆点
  double weaHeight = 50;
  double weaCircleRadius = borderAirRadius;

  /// 当前绘制的基准高
  var currHeight;
  var painter;
  double width;
  double height;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement painter

    // init
    init(size);
    // 画时间
    drawTimes(canvas);
    // 画线
    drawLine(canvas);
    // 画aqi，矩形是从左上角开始画
    drawAqi(canvas);
    // 画风向
    drawWind(canvas);
    // 画其他
    drawOthers(canvas);
  }

  /// 画其他
  void drawOthers(ui.Canvas canvas) {
    currHeight -= margin;
    painter
      ..style = PaintingStyle.stroke
      ..color = Colors.white;

    // 画天气度数，减去 虚线整高、实线高、圆的直径
    var tempHeight = currHeight;
    currHeight -= foldLineHeight + foldLinePart + weaCircleRadius * 2;
    // fake data
    var tempList = forecast24.temperature;
    var minTemper = tempList.reduce(min);
    var maxTemper = tempList.reduce(max);
    var maxHeight = maxTemper - minTemper;
    // 当前的weather类型。
    var currWea, index = 0;
    // 30高度，分maxHeight
    for (int i = 0; i < num; i++) {
      // 画度数
      var height =
          currHeight - weaHeight / maxHeight * (tempList[i] - minTemper);
      canvas.drawCircle(
          Offset(xAxis + i * xInterval, height), borderAirRadius, painter);

      var temperature;
      if (i == forecast24.sunriseIndex) {
        temperature = "日出";
      } else if (i == forecast24.sunsetIndex) {
        temperature = "日落";
      } else {
        temperature = "${tempList[i]}℃";
      }

      // 画度数文字
      TextPainter textPainter = TextPainter(
          textDirection: TextDirection.ltr,
          text: TextSpan(
              text: temperature,
              style: TextStyle(fontSize: 14.0, color: Colors.white)))
        ..layout(minWidth: width, maxWidth: width);
      var temperatureHeight = height - margin - textPainter.height;
      textPainter.paint(canvas, Offset(i * xInterval, temperatureHeight));

      // icons
      var weaList = forecast24.icons;
      var wea = forecast24.wea;
      // 画到度数的虚线
      var bottom = tempHeight - margin;
      var top = tempHeight - 4.0 - margin;
      var lineNum = ((height - bottom).abs() - foldLineDash) /
          (foldLineDash + foldLinePart);
      var lineNumExtra = lineNum % lineNum.floor();

      // 不同类型天气分割，首尾必须添加虚线，日出日落分割
      if (wea[i] != currWea ||
          i == num - 1 ||
          (needDrawSunFoldLine(forecast24.sunriseIndex) &&
              i == forecast24.sunriseIndex) ||
          (needDrawSunFoldLine(forecast24.sunsetIndex) &&
              i == forecast24.sunsetIndex)) {
        // 计算图片的位置，位于中间位置，跟随滑动
        // 绘制天气icon，第一个不绘制，线6，图5
        if (i != 0) {
          var key = weaList[i - 1];
          var weaImage = maps[key];

          var iconPositionStart = xAxis + index * xInterval;
          var iconPositionEnd = i * xInterval;
          if (iconPositionStart < scrollX) {
            iconPositionStart = scrollX;
            iconPositionStart = min(iconPositionEnd - 12, scrollX);
          }

          var width = screenWidth - 32 - 24;
          if (iconPositionEnd > scrollX + width) {
            iconPositionEnd = scrollX + width;
            iconPositionEnd = max(iconPositionStart + 12, iconPositionEnd);
          }

          var position = (iconPositionStart + iconPositionEnd) / 2;
          canvas.drawImageRect(
              weaImage,
              Rect.fromLTWH(
                  0, 0, weaImage.width.toDouble(), weaImage.height.toDouble()),
              Rect.fromLTWH(position, bottom - 24, 24, 24),
              painter);
        }
        // 赋值记录，直到遇到下一个不同的天气在绘制
        currWea = wea[i];
        index = i;

        // 遍历绘制线段组成虚线
        for (int j = 0; j < lineNum; j++) {
          canvas.drawLine(Offset(xAxis + i * xInterval, bottom),
              Offset(xAxis + i * xInterval, top), painter);
          // 增加小线段的高，最后一段特殊处理，避免超出
          bottom = top - foldLineDash;
          if (j == (lineNum - lineNumExtra).toInt() - 1) {
            top -= (foldLinePart * lineNumExtra + foldLineDash);
            //          top = height + weaCircleRadius;
          } else {
            top -= (foldLinePart + foldLineDash);
          }
        }
      }

      // 画天气度数的连线
      if (i <= num - 2) {
        var nextHeight =
            currHeight - weaHeight / maxHeight * (tempList[i + 1] - minTemper);
        var path = new Path();
        path.moveTo(xAxis + i * xInterval + weaCircleRadius, height);
        path.lineTo(xAxis + (i + 1) * xInterval - weaCircleRadius, nextHeight);
        path.close();
        canvas.drawPath(path, painter);
      }
    }
  }

  /// 是否需要绘制日出日落分割线
  bool needDrawSunFoldLine(int index) {
    if (index != -1 && index != 0) {
      var first = forecast24.icons[index - 1];
      var second = forecast24.icons[index + 1];
      // 图片类型一样，则不用画虚线分割
      return first != second &&
          forecast24.wea[index - 1] == forecast24.wea[index + 1];
    }
    return false;
  }

  /// 画风
  void drawWind(ui.Canvas canvas) {
    currHeight -= (aqiHeight);
    for (int i = 0; i < num; i++) {
      // 图片对象
      var key = forecast24.windDirection[i];
      var windImage = maps[key];
      var windSpeed = forecast24.windSpeed[i];

      canvas.drawImageRect(
          windImage,
          Rect.fromLTWH(
              0, 0, windImage.width.toDouble(), windImage.height.toDouble()),
          Rect.fromLTWH(xAxis * .5 + i * xInterval, currHeight, 10, 10),
          painter);

      // 画风级
      TextPainter textPainter = TextPainter(
          textDirection: TextDirection.ltr,
          text: TextSpan(
              text: windSpeed,
              style: TextStyle(fontSize: 10.0, color: Colors.white)))
        ..layout(minWidth: width, maxWidth: width);
      var height = (aqiHeight - textPainter.height) / 2;
      textPainter.paint(canvas,
          Offset(xAxis * .5 + i * xInterval + 10 + 2, currHeight - height));
    }
  }

  /// 画aqi
  void drawAqi(ui.Canvas canvas) {
    if (forecast24.aqi != null) {
      currHeight -= (margin * 3 + 1);
      for (int i = 0; i < num; i++) {
        painter
          ..style = PaintingStyle.fill
          ..color = Color(sunnyDecorAirBg);
        var rect = RRect.fromLTRBR(
            xAxis + i * xInterval - aqiWidth / 2,
            aqiHeight + currHeight,
            aqiWidth + i * xInterval + xAxis - aqiWidth / 2,
            currHeight,
            Radius.circular(borderAirRadius));
        canvas.drawRRect(rect, painter);

        // 画aqi文字
        TextPainter textPainter = TextPainter(
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            text: TextSpan(
                text: forecast24.aqi[i],
                style: TextStyle(fontSize: 10.0, color: Colors.white)))
          ..layout(minWidth: aqiWidth, maxWidth: aqiWidth);
        var height = (aqiHeight - textPainter.height) / 2;
        textPainter.paint(
            canvas, Offset(xAxis + i * xInterval- textPainter.width / 2, currHeight + height));
      }
    }
  }

  /// 画线
  void drawLine(ui.Canvas canvas) {
    currHeight -= margin;
    canvas.drawLine(
        Offset(0, currHeight), Offset(xInterval * num, currHeight), painter);
  }

  /// 画时间
  void drawTimes(ui.Canvas canvas) {
    currHeight -= yAxis;
    for (int i = 0; i < num; i++) {
      // 画时间
      var time = forecast24.time;
      TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          text: TextSpan(
              text: time[i],
              style: TextStyle(fontSize: 12.0, color: Colors.white)))
        ..layout(minWidth: aqiWidth, maxWidth: aqiWidth)
        ..paint(canvas, Offset(i * xInterval, currHeight));
    }
  }

  /// 初始化
  void init(ui.Size size) {
    // init
    num = forecast24.num;
    // 屏幕尺寸
    width = size.width;
    height = size.height;
    // 当前绘制的基准高
    currHeight = height;
    // 画笔
    painter = new Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 1.0;
  }

  @override
  bool shouldRepaint(ForecastHourPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.forecast24 != forecast24 ||
        scrollX != oldDelegate.scrollX;
  }
}
