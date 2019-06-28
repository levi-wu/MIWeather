import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/ui/app.dart';

void main() {
  // 设置透明系统栏
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(MyApp());
}
