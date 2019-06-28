import 'dart:convert';

import 'package:weather/data/bean/forecast_24.dart';
import 'package:weather/data/model/models.dart';
import 'package:weather/data/repository.dart';

class WeatherConvert {
  /// 根据code得到天气字符
  static String getWeatherName(int code) {
    return WeatherNameList.fromJson(json.decode(WEATHER_NAME_JSON))
        .weatherInfo
        .firstWhere((v) => code == v.code)
        .wea;
  }

  /// 获取空气质量指数
  static String getHeadAqi(int aqi) {
    if (aqi <= 100) {
      return "空气${getAqi(aqi)}";
    } else {
      return "${getAqi(aqi)}污染";
    }
  }

  /// 获取空气质量指数
  static String getAqi(int aqi) {
    if (aqi <= 50) {
      return "优";
    } else if (aqi <= 100) {
      return "良";
    } else if (aqi <= 150) {
      return "轻度";
    } else if (aqi <= 200) {
      return "中度";
    } else if (aqi <= 300) {
      return "重度";
    } else if (aqi > 300) {
      return "严重";
    }
    return "";
  }

  static String getAqiIcon(int aqi) {
    if (aqi <= 100) {
      return "images/2.0x/realtime_aqi_leaf.png";
    } else if (aqi <= 200) {
      return "images/2.0x/realtime_aqi_skull.png";
    } else {
      return "images/2.0x/realtime_aqi_gas_mask.png";
    }
  }

  static String getRainIcon(String type) {
    if (type == "rain_1") {
      return "images/2.0x/minute_rain_fall_small_rain.png";
    } else if (type == "rain_2") {
      return "images/2.0x/minute_rain_fall_middle_rain.png";
    } else if (type == "rain_3") {
      return "images/2.0x/minute_rain_fall_heavy_rain.png";
    } else {
      return "images/2.0x/minute_rain_fall_normal.png";
    }
  }

  static String getWeek(int week) {
    switch (week) {
      case 1:
        return "周一";
      case 2:
        return "周二";
      case 3:
        return "周三";
      case 4:
        return "周四";
      case 5:
        return "周五";
      case 6:
        return "周六";
      case 7:
        return "周日";
      default:
        return "";
    }
  }

  static String getFifteenItemsName(ForecastDaily daily, int index) {
    // 15天天气 & 其他天气显示
    var first;
    var isFifteen = daily.weather.value.length == 15;
    var pub = DateTime.parse(daily.pubTime);
    var dateTime = pub.add(Duration(days: 3));
    if (isFifteen) {
      if (index == 0) {
        first = "今天";
      } else if (index == 1) {
        first = "明天";
      } else {
        first = getWeek(dateTime.weekday);
      }
    } else {
      first = getWeek(dateTime.weekday);
    }

    // second
    var second;
    var weather = daily.weather.value[index];
    var from = getWeatherName(int.parse(weather.from));
    var to = getWeatherName(int.parse(weather.to));

    if (from.contains("-")) {
      from = from.split("-")[1];
    }

    if (to.contains("-")) {
      to = to.split("-")[1];
    }

    // 一天的天气相同
    if (from == to) {
      second = from;
    } else {
      second = from + "转" + to;
    }

    return first + " · " + second;
  }

  static String getFifteenItemsTemper(Temperature t, int index) {
    return "${t.value[index].from} / ${t.value[index].to} ${t.unit}";
  }

  /// 日出之后日落之前，白天，true
  static isSunRise(Value t) {
    var sunrise = DateTime.parse(t.from.split("+")[0]);
    var sunset = DateTime.parse(t.to.split("+")[0]);
    var current = DateTime.now();
    return current.isAfter(sunrise) && current.isBefore(sunset);
  }

  /// 根据 日落时间夜晚白天，不同的天气字符。
  static String getFifteenItemsIcon(ForecastDaily daily, int index) {
    var wea = daily.weather.value[index];
    var code = wea.from;
    var name = getWeatherName(int.parse(code));
    return getWeaIcons(name);
  }

  /// 根据code获取icon
  static String getWeaIconsByCode(int code, {bool day = true}) {
    return getWeaIcons(getWeatherName(code), day: day);
  }

  /// 根据名字获取icon
  static String getWeaIcons(String name, {bool day = true}) {
    if (name == "晴") {
      return day ? "images/icon_sunny.png" : "images/icon_sunny_night.png";
    } else if (name == "多云") {
      return day ? "images/icon_cloudy.png" : "images/icon_cloudy_night.png";
    } else if (name == "阴") {
      return "images/icon_overcast.png";
    } else if (name == "小雨" ||
        name == "阵雨" ||
        name.contains("-") && name.startsWith("小雨")) {
      return "images/icon_light_rain.png";
    } else if (name == "中雨" || name.contains("-") && name.startsWith("中雨")) {
      return "images/icon_moderate_rain.png";
    } else if (name == "大雨" ||
        name.contains("暴雨") ||
        name.contains("-") &&
            (name.startsWith("大雨") || name.startsWith("暴雨"))) {
      return "images/icon_heavy_rain.png";
    } else if (name == "阵雨") {
      return "images/icon_overcast.png";
    } else if (name == "雷阵雨" || name == "雷阵雨并伴有冰雹") {
      return "images/icon_t_storm.png";
    } else if (name == "冻雨") {
      return "images/icon_ice_rain.png";
    } else if (name == "雨夹雪") {
      return "images/icon_rain_snow.png";
    } else if (name == "小雪" ||
        name == "阵雪" ||
        name.contains("-") && name.startsWith("小雪")) {
      return "images/icon_light_snow.png";
    } else if (name == "中雪" || name.contains("-") && name.startsWith("中雪")) {
      return "images/icon_moderate_snow.png";
    } else if (name == "大雪" ||
        name == "暴雪" ||
        name.contains("-") && name.startsWith("大雪")) {
      return "images/icon_heavy_snow.png";
    } else if (name == "扬沙" || name.contains("沙尘暴") || name == "浮沉") {
      return "images/icon_sand.png";
    } else if (name == "霾") {
      return "images/icon_pm_dirt.png";
    } else if (name == "雾" || name == "轻雾") {
      return "images/icon_fog.png";
    } else {
      // 大风，龙卷风等其他类型
      return "images/icon_overcast.png";
    }
  }

  /// 昨日时间 + 当前时间 + 未来24h + 日出 + 日落
  /// 空气质量可以没有，未来空气信息，可能只有7天
  static Forecast24 getForecast24(Repository repo) {
    Forecast24 bean = new Forecast24();

    // 空气质量
    List<String> aqis = new List();
    // 时间
    List<String> times = new List();
    // 风向与风级
    List<String> windsDirec = new List();
    List<String> windsSpeed = new List();
    // 天气icon
    List<String> icons = new List();
    List<int> wea = new List();
    // 天气度数
    List<int> temperatures = new List();

    // current 现在
    var current = repo.hourInfo.current;

    // 时间
    var currDate = DateTime.now();
    var sunriseIndex, sunsetIndex, currentIndex;
    var windTime = repo.hourInfo.forecastHourly.wind.value;
    // 日出日落
    var sunTime = repo.hourInfo.forecastDaily.sunRiseSet.value[0];
    var sunTimeTomorrow = repo.hourInfo.forecastDaily.sunRiseSet.value[1];
    var sunriseToday = getDateTime(sunTime.from);
    var sunsetToday = getDateTime(sunTime.to);
    var sunriseTomorrow = getDateTime(sunTimeTomorrow.from);
    var sunsetTomorrow = getDateTime(sunTimeTomorrow.to);

    DateTime sunrise, sunset;

    if (currDate.isBefore(sunriseToday)) {
      sunrise = sunriseToday;
      sunset = sunsetToday;
    } else if (currDate.isAfter(sunriseToday) &&
        currDate.isBefore(sunsetToday)) {
      sunrise = sunriseTomorrow;
      sunset = sunsetToday;
    } else if (currDate.isAfter(sunsetToday)) {
      sunrise = sunriseTomorrow;
      sunset = sunsetTomorrow;
    }

    var dayHours = windTime.map<DateTime>((value) {
      return getDateTime(value.datetime);
    }).toList()
      ..add(currDate) // 添加今天的时间，后面替换
      ..sort();

    // 添加日出日落

    if (sunrise.isAfter(dayHours.first) && sunrise.isBefore(dayHours.last)) {
      dayHours.add(sunrise);
    }

    if (sunset.isAfter(dayHours.first) && sunset.isBefore(dayHours.last)) {
      dayHours.add(sunset);
    }

    var dayHoursSort = dayHours..sort();

    // 得到日出日落的位置
    sunriseIndex = dayHoursSort.indexOf(sunrise);
    sunsetIndex = dayHoursSort.indexOf(sunset);
    currentIndex = dayHoursSort.indexOf(currDate);

    var timesList = dayHoursSort.map<String>((value) {
      if (value.isAtSameMomentAs(currDate)) {
        return "现在";
      } else if (value.day - currDate.day == 1 && value.hour == 0) {
        return "${value.month}月${value.day}日";
      } else {
        return "${value.hour.toString().padLeft(2, "0")}:${value.minute.toString().padLeft(2, "0")}";
      }
    }).toList();

    times.addAll(timesList);

    // aqi
    var aqi = repo.hourInfo.forecastHourly.status == 0
        ? repo.hourInfo.forecastHourly.aqi
        : null;
    if (aqi != null) {
      var currAqi = repo.hourInfo.aqi.aqi;
      aqis.addAll(aqi.value.map((value) {
        return "$value ${WeatherConvert.getAqi(value)}";
      }));
      aqis.insert(currentIndex,
          "$currAqi ${WeatherConvert.getAqi(int.parse(currAqi))}");
      // 日出
      insertSunriseData(sunriseIndex, sunsetIndex, aqis);
    } else {
      aqis = null;
    }

    // 风力
    var wind = repo.hourInfo.forecastHourly.wind.value;
    windsSpeed.addAll(wind.map((value) {
      return "${getWindSpeed(value.speed)}级";
    }));

    windsSpeed.insert(
        currentIndex, "${getWindSpeed(current.wind.speed.value)}级");
    insertSunriseData(sunriseIndex, sunsetIndex, windsSpeed);

    // 风向
    windsDirec.addAll(wind.map((value) {
      return getWindIcons(value.direction);
    }));
    windsDirec.insert(currentIndex, getWindIcons(current.wind.direction.value));
    insertSunriseData(sunriseIndex, sunsetIndex, windsDirec);

    // 气温 + 日出日落
    var temp = repo.hourInfo.forecastHourly.temperature.value;
    temperatures.addAll(temp);
    temperatures.insert(currentIndex, int.parse(current.temperature.value));
    insertSunriseData(sunriseIndex, sunsetIndex, temperatures, isTemp: true);

    // 天气icons
    var weas = repo.hourInfo.forecastHourly.weather.value;
    weas.insert(currentIndex, int.parse(current.weather));
    insertSunriseData(sunriseIndex, sunsetIndex, weas);

    var isDay = currDate.isAfter(sunrise);
    var index = icons.length;
    icons.addAll(weas.map((value) {
      // 4 种情况
      // 1.  x 出 落 出 落
      // 2.  出 x 落 出 落
      // 3.  出 落 x 出 落
      // 4.  出 落 出 x 落
      if (sunriseIndex != -1 && sunsetIndex != -1) {
        if (sunriseIndex < sunsetIndex) {
          isDay = (index > sunriseIndex) && (index < sunsetIndex);
        } else {
          isDay = (index > sunriseIndex) || (index < sunsetIndex);
        }
      } else if (sunriseIndex != -1) {
        isDay = index > sunriseIndex;
      } else if (sunsetIndex != -1) {
        isDay = index < sunsetIndex;
      }
      index++;
      return getWeaIcons(getWeatherName(value), day: isDay);
    }));

    wea.addAll(weas);

    // 赋值
    bean
      ..num = (repo.hourInfo.forecastHourly.temperature.value.length + 1) +
          (sunriseIndex == -1 ? 0 : 1) +
          (sunsetIndex == -1 ? 0 : 1)
      ..sunsetIndex = sunsetIndex
      ..sunriseIndex = sunriseIndex
      ..temperature = temperatures
      ..time = times
      ..aqi = aqis
      ..windSpeed = windsSpeed
      ..windDirection = windsDirec
      ..icons = icons
      ..wea = wea;

    return bean;
  }

  /// 获取datetime
  static DateTime getDateTime(String time) {
    return DateTime.parse(time.split("+")[0]);
  }

  /// 风向
  static String getWindIcons(String direction) {
    var wind = (double.parse(direction) - 180).abs() % 360;
    if ((wind >= 0 && wind <= 22.5) || (wind > 337.5 && wind <= 360)) {
      // 北
      return "images/wind_north.png";
    } else if (wind > 22.5 && wind <= 67.5) {
      // 东北
      return "images/wind_northeast.png";
    } else if (wind > 67.5 && wind <= 112.5) {
      // 东
      return "images/wind_east.png";
    } else if (wind > 112.5 && wind <= 157.5) {
      // 东南
      return "images/wind_southeast.png";
    } else if (wind > 157.5 && wind <= 202.5) {
      // 南
      return "images/wind_south.png";
    } else if (wind > 202.5 && wind <= 247.5) {
      // 西南
      return "images/wind_southwest.png";
    } else if (wind > 247.5 && wind <= 292.5) {
      // 西
      return "images/wind_west.png";
    } else if (wind > 292.5 && wind <= 337.5) {
      // 西北
      return "images/wind_northwest.png";
    } else {
      return "images/wind_north.png";
    }
  }

  /// 风力
  static int getWindSpeed(String speed) {
    var s = double.parse(speed);
    if (s < 1) {
      return 0;
    } else if (s >= 1 && s <= 5) {
      return 1;
    } else if (s > 5 && s <= 11) {
      return 2;
    } else if (s > 11 && s <= 19) {
      return 3;
    } else if (s > 19 && s <= 28) {
      return 4;
    } else if (s > 28 && s <= 38) {
      return 5;
    } else if (s > 38 && s <= 49) {
      return 6;
    } else if (s > 49 && s <= 61) {
      return 7;
    } else if (s > 61 && s <= 74) {
      return 8;
    } else if (s > 74 && s <= 88) {
      return 9;
    } else if (s > 88 && s <= 102) {
      return 10;
    } else if (s > 102 && s <= 117) {
      return 11;
    } else if (s > 117 && s <= 134) {
      return 12;
    } else if (s > 134 && s <= 149) {
      return 13;
    } else if (s > 149 && s <= 166) {
      return 14;
    } else if (s > 166 && s <= 183) {
      return 15;
    } else if (s > 183 && s <= 201) {
      return 16;
    } else if (s > 201 && s <= 220) {
      return 17;
    } else {
      return 18; // 17+
    }
  }

  /// 保证添加的顺序，除了温度，日出日落都和前面的一个值相同
  static void insertSunriseData(int sunriseIndex, int sunsetIndex, List list,
      {isTemp = false}) {
    // 温度取后一位 +1 ，其他取前一位 -1
    int isTempValue = isTemp ? 0 : -1;

    if (sunriseIndex < sunsetIndex) {
      if (sunriseIndex != -1) {
        list.insert(sunriseIndex, list[sunriseIndex + isTempValue]);
      }
      if (sunsetIndex != -1) {
        list.insert(sunsetIndex, list[sunsetIndex + isTempValue]);
      }
    } else {
      if (sunsetIndex != -1) {
        list.insert(sunsetIndex, list[sunsetIndex + isTempValue]);
      }
      if (sunriseIndex != -1) {
        list.insert(sunriseIndex, list[sunriseIndex + isTempValue]);
      }
    }
  }
}
