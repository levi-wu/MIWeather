// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherNameList _$WeatherNameListFromJson(Map<String, dynamic> json) {
  return WeatherNameList(
      weatherInfo: (json['weatherinfo'] as List)
          ?.map((e) => e == null
              ? null
              : WeatherName.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$WeatherNameListToJson(WeatherNameList instance) =>
    <String, dynamic>{'weatherinfo': instance.weatherInfo};

WeatherName _$WeatherNameFromJson(Map<String, dynamic> json) {
  return WeatherName(code: json['code'] as int, wea: json['wea'] as String);
}

Map<String, dynamic> _$WeatherNameToJson(WeatherName instance) =>
    <String, dynamic>{'code': instance.code, 'wea': instance.wea};
