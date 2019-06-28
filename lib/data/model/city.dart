import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

/// 搜索城市，根据lat&lon，获取cityId.
@JsonSerializable()
class CityId {
  List<Data> data;
  int status;
  String desc;

  CityId({this.data, this.status, this.desc});

  factory CityId.fromJson(Map<String, dynamic> json) =>
      _$CityIdFromJson(json);

  Map<String, dynamic> toJson() => _$CityIdToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "city_level_name")
  String cityLevelName;
  String country;
  String upper;
  String name;
  @JsonKey(name: "prov_en")
  String provEn;
  @JsonKey(name: "cityid")
  String cityId;
  @JsonKey(name: "city_level_id")
  String cityLevelId;
  int type;
  String prov;

  Data(
      {this.cityLevelName,
      this.country,
      this.upper,
      this.name,
      this.provEn,
      this.cityId,
      this.cityLevelId,
      this.type,
      this.prov});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

/// 热门城市和name搜索返回,获取lat&lon => searchCity。
@JsonSerializable()
class City {
  String affiliation;
  String key;
  String latitude;
  String locationKey;
  String longitude;
  String name;
  int status;
  int timeZoneShift;

  City(
      {this.affiliation,
      this.key,
      this.latitude,
      this.locationKey,
      this.longitude,
      this.name,
      this.status,
      this.timeZoneShift});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  String toString() {
    return 'City{affiliation: $affiliation, key: $key, latitude: $latitude, locationKey: $locationKey, longitude: $longitude, name: $name, status: $status, timeZoneShift: $timeZoneShift}';
  }
}
