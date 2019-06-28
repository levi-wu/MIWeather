// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityId _$CityIdFromJson(Map<String, dynamic> json) {
  return CityId(
      data: (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      status: json['status'] as int,
      desc: json['desc'] as String);
}

Map<String, dynamic> _$CityIdToJson(CityId instance) => <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'desc': instance.desc
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      cityLevelName: json['city_level_name'] as String,
      country: json['country'] as String,
      upper: json['upper'] as String,
      name: json['name'] as String,
      provEn: json['prov_en'] as String,
      cityId: json['cityid'] as String,
      cityLevelId: json['city_level_id'] as String,
      type: json['type'] as int,
      prov: json['prov'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'city_level_name': instance.cityLevelName,
      'country': instance.country,
      'upper': instance.upper,
      'name': instance.name,
      'prov_en': instance.provEn,
      'cityid': instance.cityId,
      'city_level_id': instance.cityLevelId,
      'type': instance.type,
      'prov': instance.prov
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
      affiliation: json['affiliation'] as String,
      key: json['key'] as String,
      latitude: json['latitude'] as String,
      locationKey: json['locationKey'] as String,
      longitude: json['longitude'] as String,
      name: json['name'] as String,
      status: json['status'] as int,
      timeZoneShift: json['timeZoneShift'] as int);
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'affiliation': instance.affiliation,
      'key': instance.key,
      'latitude': instance.latitude,
      'locationKey': instance.locationKey,
      'longitude': instance.longitude,
      'name': instance.name,
      'status': instance.status,
      'timeZoneShift': instance.timeZoneShift
    };
