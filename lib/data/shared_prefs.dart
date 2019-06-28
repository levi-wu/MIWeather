import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/data/model/cache.dart';

const String CACHE = "local_cache";

class LocalCache {
  LocalCache._();

  static saveData(Cache data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CACHE, json.encode(data));
  }

  static Future<Cache> restoreData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonStr = prefs.getString(CACHE);
    if (jsonStr == null) {
      return null;
    } else {
      return Cache.fromJson(json.decode(jsonStr));
    }
  }

  static Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
