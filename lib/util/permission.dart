import 'dart:io';

import 'package:simple_permissions/simple_permissions.dart';
import 'package:weather/util/toast.dart';

class PermissionUtil {
  static Future<bool> location() async {
    bool hasPermission =
        await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    if (!hasPermission) {
      var requestPermissionResult = await SimplePermissions.requestPermission(
          Permission.WhenInUseLocation);
      if (requestPermissionResult == PermissionStatus.authorized) {
        return true;
      } else {
        ToastUtil.show("若不开启定位将无法获取天气信息!");
        return false;
      }
    }
    return true;
  }

  static Future<bool> hasPermission() async {
    return await SimplePermissions.checkPermission(
        Permission.WhenInUseLocation);
  }
}
