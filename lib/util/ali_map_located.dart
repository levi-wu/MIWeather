import 'package:amap_location/amap_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/util/permission.dart';

const String KEY_IOS = "1c7931f2e133e9767f9782c55382e37e";
const String KEY_ANDROID = "f59bd4d3f6d7b035e1759456f73d3da2";

class AMapLocationUtil {
  static init() async {
    // key设置
    _setApiKey();
    // 定位权限
    await PermissionUtil.location();
    // 启动
    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
  }

  static Future<AMapLocation> loadLocalPosition() async {
    return AMapLocationClient.getLocation(true);
  }

  static _setApiKey() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      AMapLocationClient.setApiKey(KEY_IOS);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      // 权限申请
      AMapLocationClient.setApiKey(KEY_ANDROID);
    }
  }

  static dispose() {
    AMapLocationClient.shutdown();
  }

  static Future<bool> _isLocatedCity(String lat, String lon) async {
    AMapLocation location = await loadLocalPosition();
    return lat == location.latitude.toString() &&
        lon == location.longitude.toString();
  }
}
