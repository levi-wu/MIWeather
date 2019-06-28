// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoHour _$WeatherInfoHourFromJson(Map json) {
  return WeatherInfoHour(
      current: json['current'] == null
          ? null
          : Current.fromJson((json['current'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )),
      forecastDaily: json['forecastDaily'] == null
          ? null
          : ForecastDaily.fromJson((json['forecastDaily'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )),
      forecastHourly: json['forecastHourly'] == null
          ? null
          : ForecastHourly.fromJson((json['forecastHourly'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )),
      indices: json['indices'] == null
          ? null
          : Indices.fromJson((json['indices'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )),
      alerts: (json['alerts'] as List)
          ?.map((e) => e == null
              ? null
              : Alert.fromJson((e as Map)?.map(
                  (k, e) => MapEntry(k as String, e),
                )))
          ?.toList(),
      yesterday: json['yesterday'] == null
          ? null
          : Yesterday.fromJson((json['yesterday'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )),
      url: json['url'] == null
          ? null
          : Url.fromJson((json['url'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )),
      brandInfo: json['brandInfo'] == null
          ? null
          : BrandInfo.fromJson((json['brandInfo'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )),
      updateTime: json['updateTime'] as int,
      aqi: json['aqi'] == null
          ? null
          : AqiAll.fromJson((json['aqi'] as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )));
}

Map<String, dynamic> _$WeatherInfoHourToJson(WeatherInfoHour instance) =>
    <String, dynamic>{
      'current': instance.current,
      'forecastDaily': instance.forecastDaily,
      'forecastHourly': instance.forecastHourly,
      'indices': instance.indices,
      'alerts': instance.alerts,
      'yesterday': instance.yesterday,
      'url': instance.url,
      'brandInfo': instance.brandInfo,
      'updateTime': instance.updateTime,
      'aqi': instance.aqi
    };

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return Current(
      feelsLike: json['feelsLike'] == null
          ? null
          : UnitValue.fromJson(json['feelsLike'] as Map<String, dynamic>),
      humidity: json['humidity'] == null
          ? null
          : UnitValue.fromJson(json['humidity'] as Map<String, dynamic>),
      pressure: json['pressure'] == null
          ? null
          : UnitValue.fromJson(json['pressure'] as Map<String, dynamic>),
      pubTime: json['pubTime'] as String,
      temperature: json['temperature'] == null
          ? null
          : UnitValue.fromJson(json['temperature'] as Map<String, dynamic>),
      uvIndex: json['uvIndex'] as String,
      visibility: json['visibility'] == null
          ? null
          : UnitValue.fromJson(json['visibility'] as Map<String, dynamic>),
      weather: json['weather'] as String,
      wind: json['wind'] == null
          ? null
          : WindCurrent.fromJson(json['wind'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'feelsLike': instance.feelsLike,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'pubTime': instance.pubTime,
      'temperature': instance.temperature,
      'uvIndex': instance.uvIndex,
      'visibility': instance.visibility,
      'weather': instance.weather,
      'wind': instance.wind
    };

UnitValue _$UnitValueFromJson(Map<String, dynamic> json) {
  return UnitValue(
      unit: json['unit'] as String, value: json['value'] as String);
}

Map<String, dynamic> _$UnitValueToJson(UnitValue instance) =>
    <String, dynamic>{'unit': instance.unit, 'value': instance.value};

WindCurrent _$WindCurrentFromJson(Map<String, dynamic> json) {
  return WindCurrent(
      direction: json['direction'] == null
          ? null
          : UnitValue.fromJson(json['direction'] as Map<String, dynamic>),
      speed: json['speed'] == null
          ? null
          : UnitValue.fromJson(json['speed'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WindCurrentToJson(WindCurrent instance) =>
    <String, dynamic>{'direction': instance.direction, 'speed': instance.speed};

ForecastDaily _$ForecastDailyFromJson(Map<String, dynamic> json) {
  return ForecastDaily(
      aqi: json['aqi'] == null
          ? null
          : Aqi.fromJson(json['aqi'] as Map<String, dynamic>),
      precipitationProbability: json['precipitationProbability'] == null
          ? null
          : PrecipitationProbability.fromJson(
              json['precipitationProbability'] as Map<String, dynamic>),
      pubTime: json['pubTime'] as String,
      status: json['status'] as int,
      sunRiseSet: json['sunRiseSet'] == null
          ? null
          : SunRiseSet.fromJson(json['sunRiseSet'] as Map<String, dynamic>),
      temperature: json['temperature'] == null
          ? null
          : Temperature.fromJson(json['temperature'] as Map<String, dynamic>),
      weather: json['weather'] == null
          ? null
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindDaily.fromJson(json['wind'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ForecastDailyToJson(ForecastDaily instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'precipitationProbability': instance.precipitationProbability,
      'pubTime': instance.pubTime,
      'status': instance.status,
      'sunRiseSet': instance.sunRiseSet,
      'temperature': instance.temperature,
      'weather': instance.weather,
      'wind': instance.wind
    };

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return Temperature(
      status: json['status'] as int,
      unit: json['unit'] as String,
      value: (json['value'] as List)
          ?.map((e) =>
              e == null ? null : Value.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'status': instance.status,
      'unit': instance.unit,
      'value': instance.value
    };

TemperatureHour _$TemperatureHourFromJson(Map<String, dynamic> json) {
  return TemperatureHour(
      pubTime: json['pubTime'] as String,
      status: json['status'] as int,
      unit: json['unit'] as String,
      value: (json['value'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$TemperatureHourToJson(TemperatureHour instance) =>
    <String, dynamic>{
      'pubTime': instance.pubTime,
      'status': instance.status,
      'unit': instance.unit,
      'value': instance.value
    };

Aqi _$AqiFromJson(Map<String, dynamic> json) {
  return Aqi(
      brandInfo: json['brandInfo'] == null
          ? null
          : BrandInfo.fromJson(json['brandInfo'] as Map<String, dynamic>),
      pubTime: json['pubTime'] as String,
      status: json['status'] as int,
      value: (json['value'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$AqiToJson(Aqi instance) => <String, dynamic>{
      'brandInfo': instance.brandInfo,
      'pubTime': instance.pubTime,
      'status': instance.status,
      'value': instance.value
    };

BrandInfo _$BrandInfoFromJson(Map<String, dynamic> json) {
  return BrandInfo(
      brands: (json['brands'] as List)
          ?.map((e) =>
              e == null ? null : Brands.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BrandInfoToJson(BrandInfo instance) =>
    <String, dynamic>{'brands': instance.brands};

Brands _$BrandsFromJson(Map<String, dynamic> json) {
  return Brands(
      brandId: json['brandId'] as String,
      logo: json['logo'] as String,
      names: json['names'] == null
          ? null
          : Names.fromJson(json['names'] as Map<String, dynamic>),
      url: json['url'] as String);
}

Map<String, dynamic> _$BrandsToJson(Brands instance) => <String, dynamic>{
      'brandId': instance.brandId,
      'logo': instance.logo,
      'names': instance.names,
      'url': instance.url
    };

Names _$NamesFromJson(Map<String, dynamic> json) {
  return Names(
      enUS: json['en_US'] as String,
      zhTW: json['zh_TW'] as String,
      zhCN: json['zh_CN'] as String);
}

Map<String, dynamic> _$NamesToJson(Names instance) => <String, dynamic>{
      'en_US': instance.enUS,
      'zh_TW': instance.zhTW,
      'zh_CN': instance.zhCN
    };

PrecipitationProbability _$PrecipitationProbabilityFromJson(
    Map<String, dynamic> json) {
  return PrecipitationProbability(
      status: json['status'] as int,
      value: (json['value'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$PrecipitationProbabilityToJson(
        PrecipitationProbability instance) =>
    <String, dynamic>{'status': instance.status, 'value': instance.value};

SunRiseSet _$SunRiseSetFromJson(Map<String, dynamic> json) {
  return SunRiseSet(
      status: json['status'] as int,
      value: (json['value'] as List)
          ?.map((e) =>
              e == null ? null : Value.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SunRiseSetToJson(SunRiseSet instance) =>
    <String, dynamic>{'status': instance.status, 'value': instance.value};

Value _$ValueFromJson(Map<String, dynamic> json) {
  return Value(from: json['from'] as String, to: json['to'] as String);
}

Map<String, dynamic> _$ValueToJson(Value instance) =>
    <String, dynamic>{'from': instance.from, 'to': instance.to};

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
      status: json['status'] as int,
      value: (json['value'] as List)
          ?.map((e) =>
              e == null ? null : Value.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$WeatherToJson(Weather instance) =>
    <String, dynamic>{'status': instance.status, 'value': instance.value};

WeatherHour _$WeatherHourFromJson(Map<String, dynamic> json) {
  return WeatherHour(
      pubTime: json['pubTime'] as String,
      status: json['status'] as int,
      value: (json['value'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$WeatherHourToJson(WeatherHour instance) =>
    <String, dynamic>{
      'pubTime': instance.pubTime,
      'status': instance.status,
      'value': instance.value
    };

ForecastHourly _$ForecastHourlyFromJson(Map<String, dynamic> json) {
  return ForecastHourly(
      aqi: json['aqi'] == null
          ? null
          : Aqi.fromJson(json['aqi'] as Map<String, dynamic>),
      desc: json['desc'] as String,
      status: json['status'] as int,
      temperature: json['temperature'] == null
          ? null
          : TemperatureHour.fromJson(
              json['temperature'] as Map<String, dynamic>),
      weather: json['weather'] == null
          ? null
          : WeatherHour.fromJson(json['weather'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindHour.fromJson(json['wind'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ForecastHourlyToJson(ForecastHourly instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'desc': instance.desc,
      'status': instance.status,
      'temperature': instance.temperature,
      'weather': instance.weather,
      'wind': instance.wind
    };

WindHour _$WindHourFromJson(Map<String, dynamic> json) {
  return WindHour(
      status: json['status'] as int,
      value: (json['value'] as List)
          ?.map((e) => e == null
              ? null
              : WindHourValue.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$WindHourToJson(WindHour instance) =>
    <String, dynamic>{'status': instance.status, 'value': instance.value};

WindHourValue _$WindHourValueFromJson(Map<String, dynamic> json) {
  return WindHourValue(
      datetime: json['datetime'] as String,
      direction: json['direction'] as String,
      speed: json['speed'] as String);
}

Map<String, dynamic> _$WindHourValueToJson(WindHourValue instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'direction': instance.direction,
      'speed': instance.speed
    };

WindDaily _$WindDailyFromJson(Map<String, dynamic> json) {
  return WindDaily(
      direction: json['direction'] == null
          ? null
          : Direction.fromJson(json['direction'] as Map<String, dynamic>),
      speed: json['speed'] == null
          ? null
          : Speed.fromJson(json['speed'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WindDailyToJson(WindDaily instance) =>
    <String, dynamic>{'direction': instance.direction, 'speed': instance.speed};

Direction _$DirectionFromJson(Map<String, dynamic> json) {
  return Direction(
      status: json['status'] as int,
      unit: json['unit'] as String,
      value: (json['value'] as List)
          ?.map((e) =>
              e == null ? null : Value.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DirectionToJson(Direction instance) => <String, dynamic>{
      'status': instance.status,
      'unit': instance.unit,
      'value': instance.value
    };

Speed _$SpeedFromJson(Map<String, dynamic> json) {
  return Speed(
      status: json['status'] as int,
      unit: json['unit'] as String,
      value: (json['value'] as List)
          ?.map((e) =>
              e == null ? null : Value.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SpeedToJson(Speed instance) => <String, dynamic>{
      'status': instance.status,
      'unit': instance.unit,
      'value': instance.value
    };

Indices _$IndicesFromJson(Map<String, dynamic> json) {
  return Indices(
      indices: (json['indices'] as List)
          ?.map((e) =>
              e == null ? null : TypeValue.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      pubTime: json['pubTime'] as String,
      status: json['status'] as int);
}

Map<String, dynamic> _$IndicesToJson(Indices instance) => <String, dynamic>{
      'indices': instance.indices,
      'pubTime': instance.pubTime,
      'status': instance.status
    };

TypeValue _$TypeValueFromJson(Map<String, dynamic> json) {
  return TypeValue(
      type: json['type'] as String, value: json['value'] as String);
}

Map<String, dynamic> _$TypeValueToJson(TypeValue instance) =>
    <String, dynamic>{'type': instance.type, 'value': instance.value};

Yesterday _$YesterdayFromJson(Map<String, dynamic> json) {
  return Yesterday(
      aqi: json['aqi'] as String,
      date: json['date'] as String,
      status: json['status'] as int,
      sunRise: json['sunRise'] as String,
      sunSet: json['sunSet'] as String,
      tempMax: json['tempMax'] as String,
      tempMin: json['tempMin'] as String,
      weatherEnd: json['weatherEnd'] as String,
      weatherStart: json['weatherStart'] as String,
      windDircEnd: json['windDircEnd'] as String,
      windDircStart: json['windDircStart'] as String,
      windSpeedEnd: json['windSpeedEnd'] as String,
      windSpeedStart: json['windSpeedStart'] as String);
}

Map<String, dynamic> _$YesterdayToJson(Yesterday instance) => <String, dynamic>{
      'aqi': instance.aqi,
      'date': instance.date,
      'status': instance.status,
      'sunRise': instance.sunRise,
      'sunSet': instance.sunSet,
      'tempMax': instance.tempMax,
      'tempMin': instance.tempMin,
      'weatherEnd': instance.weatherEnd,
      'weatherStart': instance.weatherStart,
      'windDircEnd': instance.windDircEnd,
      'windDircStart': instance.windDircStart,
      'windSpeedEnd': instance.windSpeedEnd,
      'windSpeedStart': instance.windSpeedStart
    };

Url _$UrlFromJson(Map<String, dynamic> json) {
  return Url(
      weathercn: json['weathercn'] as String, caiyun: json['caiyun'] as String);
}

Map<String, dynamic> _$UrlToJson(Url instance) => <String, dynamic>{
      'weathercn': instance.weathercn,
      'caiyun': instance.caiyun
    };

AqiAll _$AqiAllFromJson(Map<String, dynamic> json) {
  return AqiAll(
      pubTime: json['pubTime'] as String,
      so2: json['so2'] as String,
      pm10Desc: json['pm10Desc'] as String,
      o3: json['o3'] as String,
      status: json['status'] as int,
      no2Desc: json['no2Desc'] as String,
      suggest: json['suggest'] as String,
      so2Desc: json['so2Desc'] as String,
      co: json['co'] as String,
      o3Desc: json['o3Desc'] as String,
      no2: json['no2'] as String,
      primary: json['primary'] as String,
      aqi: json['aqi'] as String,
      pm10: json['pm10'] as String,
      coDesc: json['coDesc'] as String,
      src: json['src'] as String,
      pm25: json['pm25'] as String,
      pm25Desc: json['pm25Desc'] as String,
      brandInfo: json['brandInfo'] == null
          ? null
          : BrandInfo.fromJson(json['brandInfo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AqiAllToJson(AqiAll instance) => <String, dynamic>{
      'pubTime': instance.pubTime,
      'so2': instance.so2,
      'pm10Desc': instance.pm10Desc,
      'o3': instance.o3,
      'status': instance.status,
      'no2Desc': instance.no2Desc,
      'suggest': instance.suggest,
      'so2Desc': instance.so2Desc,
      'co': instance.co,
      'o3Desc': instance.o3Desc,
      'no2': instance.no2,
      'primary': instance.primary,
      'aqi': instance.aqi,
      'pm10': instance.pm10,
      'coDesc': instance.coDesc,
      'src': instance.src,
      'pm25': instance.pm25,
      'pm25Desc': instance.pm25Desc,
      'brandInfo': instance.brandInfo
    };

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return Alert(
      pubTime: json['pubTime'] as String,
      defense: (json['defense'] as List)
          ?.map((e) =>
              e == null ? null : Defense.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      title: json['title'] as String,
      detail: json['detail'] as String,
      alertId: json['alertId'] as String,
      level: json['level'] as String,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      locationKey: json['locationKey'] as String,
      type: json['type'] as String);
}

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'pubTime': instance.pubTime,
      'defense': instance.defense,
      'title': instance.title,
      'detail': instance.detail,
      'alertId': instance.alertId,
      'level': instance.level,
      'images': instance.images,
      'locationKey': instance.locationKey,
      'type': instance.type
    };

Defense _$DefenseFromJson(Map<String, dynamic> json) {
  return Defense(
      defenseText: json['defenseText'] as String,
      defenseIcon: json['defenseIcon'] as String);
}

Map<String, dynamic> _$DefenseToJson(Defense instance) => <String, dynamic>{
      'defenseText': instance.defenseText,
      'defenseIcon': instance.defenseIcon
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(icon: json['icon'] as String, notice: json['notice'] as String);
}

Map<String, dynamic> _$ImagesToJson(Images instance) =>
    <String, dynamic>{'icon': instance.icon, 'notice': instance.notice};
