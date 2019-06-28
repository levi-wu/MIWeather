// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rainfall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rainfall _$RainfallFromJson(Map<String, dynamic> json) {
  return Rainfall(
      newStr: json['new'] as String,
      status: json['status'] as int,
      precipitation: json['precipitation'] == null
          ? null
          : Precipitation.fromJson(
              json['precipitation'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RainfallToJson(Rainfall instance) => <String, dynamic>{
      'new': instance.newStr,
      'status': instance.status,
      'precipitation': instance.precipitation
    };

Precipitation _$PrecipitationFromJson(Map<String, dynamic> json) {
  return Precipitation(
      pubTime: json['pubTime'] as String,
      headIconType: json['headIconType'] as String,
      shortDescription: json['shortDescription'] as String,
      isRainOrSnow: json['isRainOrSnow'] as int,
      status: json['status'] as int,
      description: json['description'] as String,
      value:
          (json['value'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
      weather: json['weather'] as String,
      isModify: json['isModify'] as bool,
      headDescription: json['headDescription'] as String,
      isShow: json['isShow'] as bool);
}

Map<String, dynamic> _$PrecipitationToJson(Precipitation instance) =>
    <String, dynamic>{
      'pubTime': instance.pubTime,
      'headIconType': instance.headIconType,
      'shortDescription': instance.shortDescription,
      'isRainOrSnow': instance.isRainOrSnow,
      'status': instance.status,
      'description': instance.description,
      'value': instance.value,
      'weather': instance.weather,
      'isModify': instance.isModify,
      'headDescription': instance.headDescription,
      'isShow': instance.isShow
    };
