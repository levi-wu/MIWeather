import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/data/model/models.dart';
import 'package:weather/util/toast.dart';

import 'api.dart';

class Http {
  Dio _dio;
  CancelToken _cancelToken;

  Http._() {
    _dio = new Dio();
    _cancelToken = CancelToken();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: request,
      onResponse: success,
      onError: error,
    ));
  }

  static Http _http = Http._();

  factory Http() {
    return _http;
  }

  /// 请求之前的设置，超时时间等
  void request(RequestOptions options) {}

  /// 请求成功
  void success(Response e) {}

  /// 请求失败
  void error(DioError error) {
    var msg;
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        msg = "网络连接超时";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        msg = "网络接收超时";
        break;
      case DioErrorType.SEND_TIMEOUT:
        msg = "网络发送超时";
        break;
      case DioErrorType.RESPONSE:
        msg = "${error.message ?? "网络请求出错"}";
        break;
      case DioErrorType.CANCEL:
        msg = "网络请求取消出错";
        break;
      case DioErrorType.DEFAULT:
        msg = "网络请求出错";
        break;
      default:
        msg = "网络请求出错，请检查网络";
        break;
    }
    // 显示错误请求
    ToastUtil.show(msg);
  }

  /// 取消所有的网络请求
  void cancel() {
    _cancelToken.cancel("cancelled");
  }

  /// 获取cityId
  Future<CityId> getCityId(String latValue, String lonValue) async {
    Response response = (await _dio.get(SEARCH_CITY_ID,
        queryParameters: <String, dynamic>{lat: latValue, lon: lonValue},
        cancelToken: _cancelToken));
    return CityId.fromJson(json.decode(response.toString()));
  }

  /// 获得city,lat&lon.
  Future<List<City>> getHotCities() async {
    Response response = await _dio.get(HOT_CITY, cancelToken: _cancelToken);
    return (response.data as List).map((v) => new City.fromJson(v)).toList();
  }

  /// 根据名字查询city
  Future<List<City>> getCityByName(String nameValue) async {
    Response response = await _dio.get(SEARCH_CITY,
        queryParameters: <String, dynamic>{name: nameValue},
        cancelToken: _cancelToken);
    return (response.data as List).map((v) => new City.fromJson(v)).toList();
  }

  /// 获取15day天气信息
  Future<WeatherInfoDay> getWeatherInfoDay(String cityId) async {
    dynamic response = await _dio.get(WEATHER_INFO_DAY,
        queryParameters: <String, dynamic>{cityKey: cityId},
        cancelToken: _cancelToken);
    return WeatherInfoDay.fromJson(json.decode(response.toString()));
  }

  /// 获取24h天气信息
  Future<WeatherInfoHour> getWeatherInfoHour(String lat, String lon) async {
    Response response = await _dio.get(WEATHER_INFO_HOUR,
        queryParameters: <String, dynamic>{latitude: lat, longitude: lon},
        cancelToken: _cancelToken);
    return WeatherInfoHour.fromJson(json.decode(response.toString()));
  }

  /// 获取降雨信息
  Future<Rainfall> getRainfall(String lat, String lon) async {
    Response response = await _dio.get(RAINFALL,
        queryParameters: <String, dynamic>{latitude: lat, longitude: lon},
        cancelToken: _cancelToken);
    return Rainfall.fromJson(json.decode(response.toString()));
  }
}
