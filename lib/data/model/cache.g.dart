// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cache _$CacheFromJson(Map<String, dynamic> json) {
  return Cache(
      hotCities: (json['hotCities'] as List)
          ?.map((e) =>
              e == null ? null : City.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      weather: (json['weather'] as List)
          ?.map((e) => e == null
              ? null
              : WeatherInfo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CacheToJson(Cache instance) => <String, dynamic>{
      'hotCities': instance.hotCities,
      'weather': instance.weather
    };

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return WeatherInfo(
      cityId: json['cityId'] == null
          ? null
          : CityId.fromJson(json['cityId'] as Map<String, dynamic>),
      day: json['day'] == null
          ? null
          : WeatherInfoDay.fromJson(json['day'] as Map<String, dynamic>),
      hour: json['hour'] == null
          ? null
          : WeatherInfoHour.fromJson(json['hour'] as Map<String, dynamic>),
      rainfall: json['rainfall'] == null
          ? null
          : Rainfall.fromJson(json['rainfall'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'cityId': instance.cityId,
      'day': instance.day,
      'hour': instance.hour,
      'rainfall': instance.rainfall,
      'location': instance.location
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String);
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };
