import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:weather/data/repository.dart';
import 'package:weather/ui/home.dart';
import 'package:weather/ui/init.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Init(
        child: WeatherHome(),
      ),
    );
  }
}

//class _MyAppState extends State<MyApp> {
//  Repository _data;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _data = new Repository();
//  }
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    _data.dispose();
//  }
//
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return ScopedModel<Repository>(
//      model: _data,
//      child: MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: Init(
//          child: WeatherHome(),
//        ),
//      ),
//    );
//  }
//}
