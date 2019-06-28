class Forecast24 {
  /// 数据量，24 or 7 + 3
  int num;

  /// 时间
  List<String> time;

  /// 空气质量
  List<String> aqi;

  /// 风向与风级
  List<String> windDirection;
  List<String> windSpeed;

  /// 天气icon
  List<String> icons;
  List<int> wea;

  /// 天气度数
  List<int> temperature;

  /// 日出日落的位置
  int sunriseIndex;
  int sunsetIndex;

  Forecast24(
      {this.num,
      this.time,
      this.aqi,
      this.windDirection,
      this.windSpeed,
      this.icons,
      this.temperature,
      this.sunriseIndex,
      this.sunsetIndex});
}
