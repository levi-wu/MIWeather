import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/model/models.dart';

part 'cache.g.dart';

/// all data
@JsonSerializable()
class Cache {
  List<City> hotCities;
  List<WeatherInfo> weather;

  Cache({this.hotCities, this.weather});

  Map<String, dynamic> toJson() => _$CacheToJson(this);

  factory Cache.fromJson(Map<String, dynamic> json) => _$CacheFromJson(json);
}

@JsonSerializable()
class WeatherInfo {
  CityId cityId;
  WeatherInfoDay day;
  WeatherInfoHour hour;
  Rainfall rainfall;
  Location location;

  WeatherInfo({this.cityId, this.day, this.hour, this.rainfall, this.location});

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
}

@JsonSerializable()
class Location {
  String latitude;
  String longitude;

  Location({this.latitude, this.longitude});

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
