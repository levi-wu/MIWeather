/// 城市搜索，获取 name,lat,lon
const String SEARCH_CITY =
    "https://weatherapi.market.xiaomi.com/wtr-v3/location/city/search"
    "?appKey=weather20151024&sign=zUFJoAR2ZVrDy1vF3D07&romVersion=8.3.26&appVersion=9050702"
    "&alpha=false&isGlobal=false&device=gemini&modDevice=&locale=zh_cn";
const String name = "name";

/// 获取热门城市的name,lat,lon
const String HOT_CITY =
    "https://weatherapi.market.xiaomi.com/wtr-v3/location/city/hots?locale=zh_cn";

/// &latitude=30.275068&longitude=120.122317，默认是ip所在地
const String SEARCH_CITY_ID =
    "http://zhwnlapi.etouch.cn/Ecalender/api/city?type=gps&app_ts=1526114903262&app_key=99817749";
const String lat = "lat";
const String lon = "lon";

/// 降水预报，降雨带和降水值
/// &latitude=39.904&longitude=116.408
const String RAINFALL =
    "https://weatherapi.market.xiaomi.com/wtr-v3/weather/xm/forecast/minutely?locale=zh_cn&isGlobal=false&appKey=weather20151024&locationKey=weathercn%3A101280101&sign=zUFJoAR2ZVrDy1vF3D07";
const String latitude = "latitude";
const String longitude = "longitude";

/// video + advice tips
/// locationKey:'weathercn:101010100' 此值为cityId中获取。
/// &latitude=39.904&longitude=116.408
const String info =
    "https://wtradv.market.xiaomi.com/v1/page?sysVersion=development"
    "&appVersion=101130&channelId=1050&imei=6d452a0f7475c1c92131e8efed53b4e4&locationKey=weathercn101010100"
    "&country=CN&language=zh&network=WIFI&screenWidth=1080&screenHeight=1920&miuiVersion=V10"
    "&device=gemini&dislike=&model=MI+5&androidVersion=27&screenDensity=3.0";

/// 详细信息 指定channelID，在上一步中获取的channelID。
const String infoDetail =
    "https://wtradv.market.xiaomi.com/v1/page?sysVersion=development"
    "&appVersion=101130&channelId=1050&imei=6d452a0f7475c1c92131e8efed53b4e4&locationKey=weathercn101010100"
    "&country=CN&language=zh&network=WIFI&screenWidth=1080&screenHeight=1920&miuiVersion=V10"
    "&device=gemini&dislike=&model=MI+5&androidVersion=27&screenDensity=3.0";
const String channelId = "channelId";

/// 24小时天气信息，全球天气信息
/// &latitude=30.188&longitude=120.192
/// &latitude=35.683&longitude=139.809
const String WEATHER_INFO_HOUR =
    "https://weatherapi.market.xiaomi.com/wtr-v3/weather/all?isLocated=true&days=15&appKey=weather20151024&isGlobal=false&locale=zh_cn&sign=zUFJoAR2ZVrDy1vF3D07";

/// 15天 国内天气信息，国外的城市没有cityId。
/// ?citykey=101210101，cityKey 为cityId
const String WEATHER_INFO_DAY = "http://zhwnlapi.etouch.cn/Ecalender/api/v2/weather";
const cityKey = "citykey";
