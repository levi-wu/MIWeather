import 'dart:convert';

import 'package:amap_location/amap_location.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/data/model/models.dart';
import 'package:weather/data/shared_prefs.dart';
import 'package:weather/net/http.dart';
import 'package:weather/util/ali_map_located.dart';

class Repository extends Model {
  /// 数据
  Cache _cache;
  int _index = 0;
  AMapLocation _location;

  static Repository _repo = new Repository._();

  Repository._();

  factory Repository() {
    return _repo;
  }

  /// 获取实例
  static Repository of(context) =>
      ScopedModel.of<Repository>(context, rebuildOnChange: true);

  /// 初始化
  Future init() async {
    // 定位
    await AMapLocationUtil.init();
//    // 定位权限
//    await PermissionUtil.location();
    // 网络加载，当前定位地理位置
    _location = await AMapLocationUtil.loadLocalPosition();
    // 加载内存
    var data = await LocalCache.restoreData();
    if (data == null) {
      await initLocationInfo();
    } else {
      // 本地缓存
      _cache = data;
    }
  }

  /// 加载定位城市信息
  Future initLocationInfo() async {
    _cache ??= new Cache();
    // 添加定位城市数据
    await addData(
        _location?.latitude?.toString(), _location?.longitude?.toString());
  }

  /// 通过name查找，得到lat,lon,添加数据
  Future addData(String latValue, String lonValue) async {
//    try {
    print("value:${latValue}  ,${lonValue}");
    var cityId = await Http().getCityId(latValue, lonValue);
    print("cityId:${json.encode(cityId)}");
    var cities = await Http().getHotCities();
    print("cities:${json.encode(cities)}");
    var dayInfo = await Http().getWeatherInfoDay(cityId.data[0].cityId);
    print("dayInfo:${json.encode(dayInfo)}");
    var hourInfo = await Http().getWeatherInfoHour(latValue, lonValue);
    print("hourInfo:${json.encode(hourInfo)}");
    var rainInfo = await Http().getRainfall(latValue, lonValue);
    print("rainInfo:${json.encode(rainInfo)}");

    // 当前定位城市
    if (latValue == _location?.latitude?.toString() &&
        lonValue == _location?.longitude?.toString()) {
      // 修改定位城市的name，地区 + 街道
      cityId.data[0].name = "${_location?.district} ${_location?.street}";
    }

    _cache
      ..hotCities ??= cities
      ..weather ??= List();
    var info = _cache.weather;
    var location = new Location(latitude: latValue, longitude: lonValue);
    info.add(WeatherInfo(
        cityId: cityId,
        day: dayInfo,
        hour: hourInfo,
        rainfall: rainInfo,
        location: location));

    // 保存本地文件
    _addData(_cache);

    // notify
    notifyListeners();
//    } catch (e) {
//      ToastUtil.show("网络异常: ${e.toString()}");
//    }
  }

  /// 保存到本地
  void _addData(Cache all) {
    LocalCache.saveData(all);
  }

  /// 移除数据
  void remove(String lat, String lon) {
    _remove(lat, lon);
    // notify
    notifyListeners();
  }

  void _remove(String lat, String lon) {
    // 移除当前页list数据
    var first = _cache.weather.firstWhere(
        (info) => location.latitude == lat && location.longitude == lon);
    _cache.weather.remove(first);

    // 保存本地信息
    _addData(_cache);
  }

  /// 清除数据
  void dispose() {
    _location = null;
    _cache = null;
    AMapLocationUtil.dispose();
    Http().cancel();
  }

  /// 记录index,管理不同的page
  void indexInc() {
    _index++;
    notifyListeners();
  }

  void indexDec() {
    _index--;
    notifyListeners();
  }

  /// 刷新当前的页面 index
  /// 根据lat&lon刷新
  Future refresh() async {
    await _refresh();
  }

  Future _refresh() async {
    _location = await AMapLocationUtil.loadLocalPosition();
    // 记录当前值
    var _lat = location.latitude;
    var _lon = location.longitude;
    // 刷新数据
    String lat =
        _isLocationPage() ? _location?.latitude?.toString() : location.latitude;
    String lon = _isLocationPage()
        ? _location?.longitude?.toString()
        : location.longitude;
    await addData(lat, lon).then((v) {
      // 移除数据,最后移除
      _remove(_lat, _lon);
    });
  }

  /// 是否定位页面
  bool _isLocationPage() {
    return _index == 0;
  }

  /// 获取热门城市
  List<City> get hotCities => _cache?.hotCities;

  /// 获取当页面数据
  WeatherInfo get _weather => _cache?.weather[_index];

  /// 获取数据的大小
  int get length => _cache?.weather?.length;

  /// 获取当前城市
  CityId get city => _weather?.cityId;

  /// 获取location
  Location get location => _weather?.location;

  /// 获取15天信息
  WeatherInfoDay get dayInfo => _weather?.day;

  /// 获取24h信息
  WeatherInfoHour get hourInfo => _weather?.hour;

  /// 获取降雨信息
  Rainfall get rainfall => _weather?.rainfall;

  /// 获取当前index
  int get index => _index;
}
