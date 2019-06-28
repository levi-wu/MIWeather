import 'package:json_annotation/json_annotation.dart';

part 'weather_hour.g.dart';

/// 24h，天气信息
@JsonSerializable(anyMap: true)
class WeatherInfoHour {
  Current current; // 当前的温度，体感，压强，风速等信息
  ForecastDaily forecastDaily; // 当日，空气，降水，日出，温度，风速信息
  ForecastHourly forecastHourly;
  Indices indices; // 各项指数，体验，压力洗车等
  @JsonKey(encodeEmptyCollection: true)
  List<Alert> alerts; // 预警
  Yesterday yesterday;
  Url url;
  BrandInfo brandInfo;
  int updateTime; // 事件戳
  AqiAll aqi; // 空气信息

  WeatherInfoHour(
      {this.current,
      this.forecastDaily,
      this.forecastHourly,
      this.indices,
      this.alerts,
      this.yesterday,
      this.url,
      this.brandInfo,
      this.updateTime,
      this.aqi});

  factory WeatherInfoHour.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoHourFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoHourToJson(this);
}

/// 当前的温度，体感，压强，风速等信息
@JsonSerializable()
class Current {
  UnitValue feelsLike;
  UnitValue humidity;
  UnitValue pressure;
  String pubTime;
  UnitValue temperature;
  String uvIndex;
  UnitValue visibility;
  String weather;
  WindCurrent wind;

  Current(
      {this.feelsLike,
      this.humidity,
      this.pressure,
      this.pubTime,
      this.temperature,
      this.uvIndex,
      this.visibility,
      this.weather,
      this.wind});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

/// 单位和值信息
@JsonSerializable()
class UnitValue {
  String unit;
  String value;

  UnitValue({this.unit, this.value});

  factory UnitValue.fromJson(Map<String, dynamic> json) =>
      _$UnitValueFromJson(json);

  Map<String, dynamic> toJson() => _$UnitValueToJson(this);

  @override
  String toString() {
    return "$value$unit";
  }
}

/// 风信息
@JsonSerializable()
class WindCurrent {
  UnitValue direction;
  UnitValue speed;

  WindCurrent({this.direction, this.speed});

  factory WindCurrent.fromJson(Map<String, dynamic> json) =>
      _$WindCurrentFromJson(json);

  Map<String, dynamic> toJson() => _$WindCurrentToJson(this);
}

/// 当日，空气，降水，日出，温度，风速信息
@JsonSerializable()
class ForecastDaily {
  Aqi aqi;
  PrecipitationProbability precipitationProbability; // 降水概率
  String pubTime;
  int status;
  SunRiseSet sunRiseSet;
  Temperature temperature;
  Weather weather;
  WindDaily wind;

  ForecastDaily(
      {this.aqi,
      this.precipitationProbability,
      this.pubTime,
      this.status,
      this.sunRiseSet,
      this.temperature,
      this.weather,
      this.wind});

  factory ForecastDaily.fromJson(Map<String, dynamic> json) =>
      _$ForecastDailyFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDailyToJson(this);
}

/// 15个气温
@JsonSerializable()
class Temperature {
  int status;
  String unit;
  List<Value> value;

  Temperature({this.status, this.unit, this.value});

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}

/// 24h气温
@JsonSerializable()
class TemperatureHour {
  String pubTime;
  int status;
  String unit;
  List<int> value;

  TemperatureHour({this.pubTime, this.status, this.unit, this.value});

  factory TemperatureHour.fromJson(Map<String, dynamic> json) =>
      _$TemperatureHourFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureHourToJson(this);
}

/// 天气质量
@JsonSerializable()
class Aqi {
  BrandInfo brandInfo; // 彩云天气
  String pubTime;
  int status;
  List<int> value; // 值

  Aqi({this.brandInfo, this.pubTime, this.status, this.value});

  factory Aqi.fromJson(Map<String, dynamic> json) => _$AqiFromJson(json);

  Map<String, dynamic> toJson() => _$AqiToJson(this);
}

/// 天气信息来源
@JsonSerializable()
class BrandInfo {
  List<Brands> brands;

  BrandInfo({this.brands});

  factory BrandInfo.fromJson(Map<String, dynamic> json) =>
      _$BrandInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandInfoToJson(this);
}

@JsonSerializable()
class Brands {
  String brandId;
  String logo;
  Names names;
  String url;

  Brands({this.brandId, this.logo, this.names, this.url});

  factory Brands.fromJson(Map<String, dynamic> json) => _$BrandsFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsToJson(this);
}

@JsonSerializable()
class Names {
  @JsonKey(name: "en_US")
  String enUS;
  @JsonKey(name: "zh_TW")
  String zhTW;
  @JsonKey(name: "zh_CN")
  String zhCN;

  Names({this.enUS, this.zhTW, this.zhCN});

  factory Names.fromJson(Map<String, dynamic> json) => _$NamesFromJson(json);

  Map<String, dynamic> toJson() => _$NamesToJson(this);
}

/// 降水概率
@JsonSerializable()
class PrecipitationProbability {
  int status;
  List<String> value; // 5个概率值

  PrecipitationProbability({this.status, this.value});

  factory PrecipitationProbability.fromJson(Map<String, dynamic> json) =>
      _$PrecipitationProbabilityFromJson(json);

  Map<String, dynamic> toJson() => _$PrecipitationProbabilityToJson(this);
}

/// 15个日出
@JsonSerializable()
class SunRiseSet {
  int status;
  List<Value> value;

  SunRiseSet({this.status, this.value});

  factory SunRiseSet.fromJson(Map<String, dynamic> json) =>
      _$SunRiseSetFromJson(json);

  Map<String, dynamic> toJson() => _$SunRiseSetToJson(this);
}

@JsonSerializable()
class Value {
  String from;
  String to;

  Value({this.from, this.to});

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);

  Map<String, dynamic> toJson() => _$ValueToJson(this);
}

/// 天气变化，阴天，晴天。
@JsonSerializable()
class Weather {
  int status;
  List<Value> value;

  Weather({this.status, this.value});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

/// 24h天气
@JsonSerializable()
class WeatherHour {
  String pubTime;
  int status;
  List<int> value;

  WeatherHour({this.pubTime, this.status, this.value});

  factory WeatherHour.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherHourToJson(this);
}

/// 逐小时预报
@JsonSerializable()
class ForecastHourly {
  Aqi aqi; // 24小时值
  String desc;
  int status;
  TemperatureHour temperature; // 24小时温度
  WeatherHour weather; // 24小时天气
  WindHour wind;

  ForecastHourly(
      {this.aqi,
      this.desc,
      this.status,
      this.temperature,
      this.weather,
      this.wind});

  factory ForecastHourly.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourlyFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastHourlyToJson(this);
}

/// 风速--小时
@JsonSerializable()
class WindHour {
  int status;
  List<WindHourValue> value;

  WindHour({this.status, this.value});

  factory WindHour.fromJson(Map<String, dynamic> json) =>
      _$WindHourFromJson(json);

  Map<String, dynamic> toJson() => _$WindHourToJson(this);
}

@JsonSerializable()
class WindHourValue {
  String datetime;
  String direction;
  String speed;

  WindHourValue({this.datetime, this.direction, this.speed});

  factory WindHourValue.fromJson(Map<String, dynamic> json) =>
      _$WindHourValueFromJson(json);

  Map<String, dynamic> toJson() => _$WindHourValueToJson(this);
}

/// 风速.天
@JsonSerializable()
class WindDaily {
  Direction direction;
  Speed speed;

  WindDaily({this.direction, this.speed});

  factory WindDaily.fromJson(Map<String, dynamic> json) =>
      _$WindDailyFromJson(json);

  Map<String, dynamic> toJson() => _$WindDailyToJson(this);
}

/// 风向
@JsonSerializable()
class Direction {
  int status;
  String unit;
  List<Value> value;

  Direction({this.status, this.unit, this.value});

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionToJson(this);
}

/// 风速
@JsonSerializable()
class Speed {
  int status;
  String unit;
  List<Value> value;

  Speed({this.status, this.unit, this.value});

  factory Speed.fromJson(Map<String, dynamic> json) => _$SpeedFromJson(json);

  Map<String, dynamic> toJson() => _$SpeedToJson(this);
}

/// 指数
@JsonSerializable()
class Indices {
  List<TypeValue> indices;
  String pubTime;
  int status;

  Indices({this.indices, this.pubTime, this.status});

  factory Indices.fromJson(Map<String, dynamic> json) =>
      _$IndicesFromJson(json);

  Map<String, dynamic> toJson() => _$IndicesToJson(this);
}

@JsonSerializable()
class TypeValue {
  String type;
  String value;

  TypeValue({this.type, this.value});

  factory TypeValue.fromJson(Map<String, dynamic> json) =>
      _$TypeValueFromJson(json);

  Map<String, dynamic> toJson() => _$TypeValueToJson(this);
}

/// 昨天天气信息
@JsonSerializable()
class Yesterday {
  String aqi;
  String date;
  int status;
  String sunRise;
  String sunSet;
  String tempMax;
  String tempMin;
  String weatherEnd;
  String weatherStart;
  String windDircEnd;
  String windDircStart;
  String windSpeedEnd;
  String windSpeedStart;

  Yesterday(
      {this.aqi,
      this.date,
      this.status,
      this.sunRise,
      this.sunSet,
      this.tempMax,
      this.tempMin,
      this.weatherEnd,
      this.weatherStart,
      this.windDircEnd,
      this.windDircStart,
      this.windSpeedEnd,
      this.windSpeedStart});

  factory Yesterday.fromJson(Map<String, dynamic> json) =>
      _$YesterdayFromJson(json);

  Map<String, dynamic> toJson() => _$YesterdayToJson(this);
}

/// 空 ignore
@JsonSerializable()
class Url {
  String weathercn;
  String caiyun;

  Url({this.weathercn, this.caiyun});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}

/// 所有的AQI信息与指数
@JsonSerializable()
class AqiAll {
  String pubTime;
  String so2;
  String pm10Desc;
  String o3;
  int status;
  String no2Desc;
  String suggest;
  String so2Desc;
  String co;
  String o3Desc;
  String no2;
  String primary;
  String aqi;
  String pm10;
  String coDesc;
  String src;
  String pm25;
  String pm25Desc;
  BrandInfo brandInfo;

  AqiAll(
      {this.pubTime,
      this.so2,
      this.pm10Desc,
      this.o3,
      this.status,
      this.no2Desc,
      this.suggest,
      this.so2Desc,
      this.co,
      this.o3Desc,
      this.no2,
      this.primary,
      this.aqi,
      this.pm10,
      this.coDesc,
      this.src,
      this.pm25,
      this.pm25Desc,
      this.brandInfo});

  factory AqiAll.fromJson(Map<String, dynamic> json) => _$AqiAllFromJson(json);

  Map<String, dynamic> toJson() => _$AqiAllToJson(this);
}

/// 大风雷电预警
@JsonSerializable()
class Alert {
  String pubTime;
  @JsonKey(required: false)
  List<Defense> defense;
  String title;
  String detail;
  String alertId;
  String level;
  Images images;
  String locationKey;
  String type;

  Alert(
      {this.pubTime,
      this.defense,
      this.title,
      this.detail,
      this.alertId,
      this.level,
      this.images,
      this.locationKey,
      this.type});

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  Map<String, dynamic> toJson() => _$AlertToJson(this);
}

/// 预警详细信息
@JsonSerializable()
class Defense {
  String defenseText;
  String defenseIcon;

  Defense({this.defenseText, this.defenseIcon});

  factory Defense.fromJson(Map<String, dynamic> json) =>
      _$DefenseFromJson(json);

  Map<String, dynamic> toJson() => _$DefenseToJson(this);
}

/// 预警icon
@JsonSerializable()
class Images {
  String icon;
  String notice;

  Images({this.icon, this.notice});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
