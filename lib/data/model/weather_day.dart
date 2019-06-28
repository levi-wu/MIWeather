import 'package:json_annotation/json_annotation.dart';

part 'weather_day.g.dart';

/// 15天天气信息
/// citykey=101010100，cityId
@JsonSerializable()
class WeatherInfoDay {
  List<Indexes> indexes;
  Meta meta;
  String forecastUpTime;
  WeatherUrls weatherUrls;
  List<Forecast15> forecast15;
  String hourfcUpDate;
  List<Forecast> forecast;
  List<Hourfc> hourfc;
  @JsonKey(encodeEmptyCollection: true)
  List<XianHao> xianhao; // 空值
  Source source;
  Evn evn;
  Observe observe;

  WeatherInfoDay(
      {this.indexes,
      this.meta,
      this.forecastUpTime,
      this.weatherUrls,
      this.forecast15,
      this.hourfcUpDate,
      this.forecast,
      this.hourfc,
      this.xianhao,
      this.source,
      this.evn,
      this.observe});

  factory WeatherInfoDay.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoDayFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoDayToJson(this);
}

/// 生活指数信息
@JsonSerializable()
class Indexes {
  Ext ext;
  String valueV2;
  String name;
  String value;
  String desc;

  Indexes({this.ext, this.valueV2, this.name, this.value, this.desc});

  factory Indexes.fromJson(Map<String, dynamic> json) =>
      _$IndexesFromJson(json);

  Map<String, dynamic> toJson() => _$IndexesToJson(this);
}

/// 生活指数的图片
@JsonSerializable()
class Ext {
  String icon;
  String statsKey;

  Ext({this.icon, this.statsKey});

  factory Ext.fromJson(Map<String, dynamic> json) => _$ExtFromJson(json);

  Map<String, dynamic> toJson() => _$ExtToJson(this);
}

/// ignore
@JsonSerializable()
class Meta {
  @JsonKey(name: "up_date")
  String upDate;
  @JsonKey(name: "post_id")
  String postId;
  @JsonKey(name: "citykey")
  String cityKey;
  String city;
  String upper;
  String htmlUrl;
  @JsonKey(name: "wcity")
  List<String> wCity;
  @JsonKey(name: "up_time")
  String upTime;
  int status;

  Meta(
      {this.upDate,
      this.postId,
      this.cityKey,
      this.city,
      this.upper,
      this.htmlUrl,
      this.wCity,
      this.upTime,
      this.status});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

/// 天气相关的三方URL信息
@JsonSerializable()
class WeatherUrls {
  @JsonKey(name: "w_life_index_more")
  String wLifeIndexMore;
  @JsonKey(name: "w_forecast_90")
  String wForecast90;
  @JsonKey(name: "w_gradual_hour")
  String wGradualHour;

  WeatherUrls({this.wLifeIndexMore, this.wForecast90, this.wGradualHour});

  factory WeatherUrls.fromJson(Map<String, dynamic> json) =>
      _$WeatherUrlsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherUrlsToJson(this);
}

/// 15天天气信息
@JsonSerializable()
class Forecast15 {
  String date;
  String sunrise; //日出
  int high; // 温度
  String forecastUrl; // 三方url
  int low;
  String sunset; // 日落
  DayNightInfo night;
  int aqi; // 空气质量
  String forecastAirUrl; // 空“”
  DayNightInfo day;

  Forecast15(
      {this.date,
      this.sunrise,
      this.high,
      this.forecastUrl,
      this.low,
      this.sunset,
      this.night,
      this.aqi,
      this.forecastAirUrl,
      this.day});

  factory Forecast15.fromJson(Map<String, dynamic> json) =>
      _$Forecast15FromJson(json);

  Map<String, dynamic> toJson() => _$Forecast15ToJson(this);
}

/// 15天预报，夜间气象
@JsonSerializable()
class DayNightInfo {
  @JsonKey(name: "wthr")
  String weather;
  String bgPic;
  String smPic;
  String wp; // 风 级数 ：3级
  int type;
  String wd; // 风向：东北风
  String notice; // 夜间提示语： “夜晚多云，愿你梦里有月光”

  DayNightInfo(
      {this.weather,
      this.bgPic,
      this.smPic,
      this.wp,
      this.type,
      this.wd,
      this.notice});

  factory DayNightInfo.fromJson(Map<String, dynamic> json) =>
      _$DayNightInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DayNightInfoToJson(this);
}

/// 5天的天气信息
@JsonSerializable()
class Forecast {
  String date;
  String sunrise;
  int high;
  int low;
  String sunset;
  DayNightInfo night;
  int aqi;
  DayNightInfo day;

  Forecast(
      {this.date,
      this.sunrise,
      this.high,
      this.low,
      this.sunset,
      this.night,
      this.aqi,
      this.day});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

/// 当前查询时间开始后24h，天气信息
@JsonSerializable()
class Hourfc {
  int wthr;
  String shidu;
  String hourfcUrl;
  String wp;
  String typeDesc;
  String time;
  int type;
  String wd;

  Hourfc(
      {this.wthr,
      this.shidu,
      this.hourfcUrl,
      this.wp,
      this.typeDesc,
      this.time,
      this.type,
      this.wd});

  factory Hourfc.fromJson(Map<String, dynamic> json) => _$HourfcFromJson(json);

  Map<String, dynamic> toJson() => _$HourfcToJson(this);
}

/// 天气信息来源
@JsonSerializable()
class Source {
  String link;
  String icon;
  String title;

  Source({this.link, this.icon, this.title});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

/// 空气信息，pm2.5,空气质量等
@JsonSerializable()
class Evn {
  int no2; // 二氧化氮
  String mp; // 颗粒物含量
  int pm25;
  int o3; // 臭氧
  int so2;
  int pm10;
  int aqi; // 空气质量
  String suggest; // 建议
  String time;
  int co;
  String quality;

  Evn(
      {this.no2,
      this.mp,
      this.pm25,
      this.o3,
      this.so2,
      this.pm10,
      this.aqi,
      this.suggest,
      this.time,
      this.co,
      this.quality});

  factory Evn.fromJson(Map<String, dynamic> json) => _$EvnFromJson(json);

  Map<String, dynamic> toJson() => _$EvnToJson(this);
}

/// 天气综合信息
@JsonSerializable()
class Observe {
  String shidu;
  String wthr;
  int temp;
  ImgInfo night;
  String upTime;
  String wp;
  String tigan;
  int type;
  String wd;
  ImgInfo day;

  Observe(
      {this.shidu,
      this.wthr,
      this.temp,
      this.night,
      this.upTime,
      this.wp,
      this.tigan,
      this.type,
      this.wd,
      this.day});

  factory Observe.fromJson(Map<String, dynamic> json) =>
      _$ObserveFromJson(json);

  Map<String, dynamic> toJson() => _$ObserveToJson(this);
}

/// 图片信息
@JsonSerializable()
class ImgInfo {
  String bgPic;
  String smPic;

  ImgInfo({this.bgPic, this.smPic});

  factory ImgInfo.fromJson(Map<String, dynamic> json) =>
      _$ImgInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ImgInfoToJson(this);
}

/// 限号
@JsonSerializable()
class XianHao {
  @JsonKey(name: "f_date")
  String fDate;
  @JsonKey(name: "f_number")
  String fNumber;
  @JsonKey(name: "action_type")
  String actionType;
  @JsonKey(name: "item_id")
  String itemId;
  @JsonKey(name: "click_url")
  String clickUrl;
  String title;

  XianHao(
      {this.fDate,
      this.fNumber,
      this.actionType,
      this.itemId,
      this.clickUrl,
      this.title});

  factory XianHao.fromJson(Map<String, dynamic> json) =>
      _$XianHaoFromJson(json);

  Map<String, dynamic> toJson() => _$XianHaoToJson(this);
}
