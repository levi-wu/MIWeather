// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoDay _$WeatherInfoDayFromJson(Map<String, dynamic> json) {
  return WeatherInfoDay(
      indexes: (json['indexes'] as List)
          ?.map((e) =>
              e == null ? null : Indexes.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      forecastUpTime: json['forecastUpTime'] as String,
      weatherUrls: json['weatherUrls'] == null
          ? null
          : WeatherUrls.fromJson(json['weatherUrls'] as Map<String, dynamic>),
      forecast15: (json['forecast15'] as List)
          ?.map((e) =>
              e == null ? null : Forecast15.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      hourfcUpDate: json['hourfcUpDate'] as String,
      forecast: (json['forecast'] as List)
          ?.map((e) =>
              e == null ? null : Forecast.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      hourfc: (json['hourfc'] as List)
          ?.map((e) =>
              e == null ? null : Hourfc.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      xianhao: (json['xianhao'] as List)
          ?.map((e) =>
              e == null ? null : XianHao.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      evn: json['evn'] == null
          ? null
          : Evn.fromJson(json['evn'] as Map<String, dynamic>),
      observe: json['observe'] == null
          ? null
          : Observe.fromJson(json['observe'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WeatherInfoDayToJson(WeatherInfoDay instance) =>
    <String, dynamic>{
      'indexes': instance.indexes,
      'meta': instance.meta,
      'forecastUpTime': instance.forecastUpTime,
      'weatherUrls': instance.weatherUrls,
      'forecast15': instance.forecast15,
      'hourfcUpDate': instance.hourfcUpDate,
      'forecast': instance.forecast,
      'hourfc': instance.hourfc,
      'xianhao': instance.xianhao,
      'source': instance.source,
      'evn': instance.evn,
      'observe': instance.observe
    };

Indexes _$IndexesFromJson(Map<String, dynamic> json) {
  return Indexes(
      ext: json['ext'] == null
          ? null
          : Ext.fromJson(json['ext'] as Map<String, dynamic>),
      valueV2: json['valueV2'] as String,
      name: json['name'] as String,
      value: json['value'] as String,
      desc: json['desc'] as String);
}

Map<String, dynamic> _$IndexesToJson(Indexes instance) => <String, dynamic>{
      'ext': instance.ext,
      'valueV2': instance.valueV2,
      'name': instance.name,
      'value': instance.value,
      'desc': instance.desc
    };

Ext _$ExtFromJson(Map<String, dynamic> json) {
  return Ext(
      icon: json['icon'] as String, statsKey: json['statsKey'] as String);
}

Map<String, dynamic> _$ExtToJson(Ext instance) =>
    <String, dynamic>{'icon': instance.icon, 'statsKey': instance.statsKey};

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
      upDate: json['up_date'] as String,
      postId: json['post_id'] as String,
      cityKey: json['citykey'] as String,
      city: json['city'] as String,
      upper: json['upper'] as String,
      htmlUrl: json['htmlUrl'] as String,
      wCity: (json['wcity'] as List)?.map((e) => e as String)?.toList(),
      upTime: json['up_time'] as String,
      status: json['status'] as int);
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'up_date': instance.upDate,
      'post_id': instance.postId,
      'citykey': instance.cityKey,
      'city': instance.city,
      'upper': instance.upper,
      'htmlUrl': instance.htmlUrl,
      'wcity': instance.wCity,
      'up_time': instance.upTime,
      'status': instance.status
    };

WeatherUrls _$WeatherUrlsFromJson(Map<String, dynamic> json) {
  return WeatherUrls(
      wLifeIndexMore: json['w_life_index_more'] as String,
      wForecast90: json['w_forecast_90'] as String,
      wGradualHour: json['w_gradual_hour'] as String);
}

Map<String, dynamic> _$WeatherUrlsToJson(WeatherUrls instance) =>
    <String, dynamic>{
      'w_life_index_more': instance.wLifeIndexMore,
      'w_forecast_90': instance.wForecast90,
      'w_gradual_hour': instance.wGradualHour
    };

Forecast15 _$Forecast15FromJson(Map<String, dynamic> json) {
  return Forecast15(
      date: json['date'] as String,
      sunrise: json['sunrise'] as String,
      high: json['high'] as int,
      forecastUrl: json['forecastUrl'] as String,
      low: json['low'] as int,
      sunset: json['sunset'] as String,
      night: json['night'] == null
          ? null
          : DayNightInfo.fromJson(json['night'] as Map<String, dynamic>),
      aqi: json['aqi'] as int,
      forecastAirUrl: json['forecastAirUrl'] as String,
      day: json['day'] == null
          ? null
          : DayNightInfo.fromJson(json['day'] as Map<String, dynamic>));
}

Map<String, dynamic> _$Forecast15ToJson(Forecast15 instance) =>
    <String, dynamic>{
      'date': instance.date,
      'sunrise': instance.sunrise,
      'high': instance.high,
      'forecastUrl': instance.forecastUrl,
      'low': instance.low,
      'sunset': instance.sunset,
      'night': instance.night,
      'aqi': instance.aqi,
      'forecastAirUrl': instance.forecastAirUrl,
      'day': instance.day
    };

DayNightInfo _$DayNightInfoFromJson(Map<String, dynamic> json) {
  return DayNightInfo(
      weather: json['wthr'] as String,
      bgPic: json['bgPic'] as String,
      smPic: json['smPic'] as String,
      wp: json['wp'] as String,
      type: json['type'] as int,
      wd: json['wd'] as String,
      notice: json['notice'] as String);
}

Map<String, dynamic> _$DayNightInfoToJson(DayNightInfo instance) =>
    <String, dynamic>{
      'wthr': instance.weather,
      'bgPic': instance.bgPic,
      'smPic': instance.smPic,
      'wp': instance.wp,
      'type': instance.type,
      'wd': instance.wd,
      'notice': instance.notice
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
      date: json['date'] as String,
      sunrise: json['sunrise'] as String,
      high: json['high'] as int,
      low: json['low'] as int,
      sunset: json['sunset'] as String,
      night: json['night'] == null
          ? null
          : DayNightInfo.fromJson(json['night'] as Map<String, dynamic>),
      aqi: json['aqi'] as int,
      day: json['day'] == null
          ? null
          : DayNightInfo.fromJson(json['day'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'date': instance.date,
      'sunrise': instance.sunrise,
      'high': instance.high,
      'low': instance.low,
      'sunset': instance.sunset,
      'night': instance.night,
      'aqi': instance.aqi,
      'day': instance.day
    };

Hourfc _$HourfcFromJson(Map<String, dynamic> json) {
  return Hourfc(
      wthr: json['wthr'] as int,
      shidu: json['shidu'] as String,
      hourfcUrl: json['hourfcUrl'] as String,
      wp: json['wp'] as String,
      typeDesc: json['typeDesc'] as String,
      time: json['time'] as String,
      type: json['type'] as int,
      wd: json['wd'] as String);
}

Map<String, dynamic> _$HourfcToJson(Hourfc instance) => <String, dynamic>{
      'wthr': instance.wthr,
      'shidu': instance.shidu,
      'hourfcUrl': instance.hourfcUrl,
      'wp': instance.wp,
      'typeDesc': instance.typeDesc,
      'time': instance.time,
      'type': instance.type,
      'wd': instance.wd
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
      link: json['link'] as String,
      icon: json['icon'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'link': instance.link,
      'icon': instance.icon,
      'title': instance.title
    };

Evn _$EvnFromJson(Map<String, dynamic> json) {
  return Evn(
      no2: json['no2'] as int,
      mp: json['mp'] as String,
      pm25: json['pm25'] as int,
      o3: json['o3'] as int,
      so2: json['so2'] as int,
      pm10: json['pm10'] as int,
      aqi: json['aqi'] as int,
      suggest: json['suggest'] as String,
      time: json['time'] as String,
      co: json['co'] as int,
      quality: json['quality'] as String);
}

Map<String, dynamic> _$EvnToJson(Evn instance) => <String, dynamic>{
      'no2': instance.no2,
      'mp': instance.mp,
      'pm25': instance.pm25,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm10': instance.pm10,
      'aqi': instance.aqi,
      'suggest': instance.suggest,
      'time': instance.time,
      'co': instance.co,
      'quality': instance.quality
    };

Observe _$ObserveFromJson(Map<String, dynamic> json) {
  return Observe(
      shidu: json['shidu'] as String,
      wthr: json['wthr'] as String,
      temp: json['temp'] as int,
      night: json['night'] == null
          ? null
          : ImgInfo.fromJson(json['night'] as Map<String, dynamic>),
      upTime: json['upTime'] as String,
      wp: json['wp'] as String,
      tigan: json['tigan'] as String,
      type: json['type'] as int,
      wd: json['wd'] as String,
      day: json['day'] == null
          ? null
          : ImgInfo.fromJson(json['day'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ObserveToJson(Observe instance) => <String, dynamic>{
      'shidu': instance.shidu,
      'wthr': instance.wthr,
      'temp': instance.temp,
      'night': instance.night,
      'upTime': instance.upTime,
      'wp': instance.wp,
      'tigan': instance.tigan,
      'type': instance.type,
      'wd': instance.wd,
      'day': instance.day
    };

ImgInfo _$ImgInfoFromJson(Map<String, dynamic> json) {
  return ImgInfo(
      bgPic: json['bgPic'] as String, smPic: json['smPic'] as String);
}

Map<String, dynamic> _$ImgInfoToJson(ImgInfo instance) =>
    <String, dynamic>{'bgPic': instance.bgPic, 'smPic': instance.smPic};

XianHao _$XianHaoFromJson(Map<String, dynamic> json) {
  return XianHao(
      fDate: json['f_date'] as String,
      fNumber: json['f_number'] as String,
      actionType: json['action_type'] as String,
      itemId: json['item_id'] as String,
      clickUrl: json['click_url'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$XianHaoToJson(XianHao instance) => <String, dynamic>{
      'f_date': instance.fDate,
      'f_number': instance.fNumber,
      'action_type': instance.actionType,
      'item_id': instance.itemId,
      'click_url': instance.clickUrl,
      'title': instance.title
    };
