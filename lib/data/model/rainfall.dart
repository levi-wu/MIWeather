import 'package:json_annotation/json_annotation.dart';

part 'rainfall.g.dart';

@JsonSerializable()
class Rainfall {
  @JsonKey(name: "new")
  String newStr;
  int status;
  Precipitation precipitation;

  Rainfall({this.newStr, this.status, this.precipitation});

  factory Rainfall.fromJson(Map<String, dynamic> json) =>
      _$RainfallFromJson(json);

  Map<String, dynamic> toJson() => _$RainfallToJson(this);
}

@JsonSerializable()
class Precipitation {
  String pubTime;
  String headIconType;
  String shortDescription;
  int isRainOrSnow;
  int status;
  String description;
  List<double> value;
  String weather;
  bool isModify;
  String headDescription;
  bool isShow;

  Precipitation(
      {this.pubTime,
      this.headIconType,
      this.shortDescription,
      this.isRainOrSnow,
      this.status,
      this.description,
      this.value,
      this.weather,
      this.isModify,
      this.headDescription,
      this.isShow});

  factory Precipitation.fromJson(Map<String, dynamic> json) =>
      _$PrecipitationFromJson(json);

  Map<String, dynamic> toJson() => _$PrecipitationToJson(this);
}
