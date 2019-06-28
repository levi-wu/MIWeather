import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:weather/util/weather_convert.dart';

class ImageUtils {
  /// 获取图片信息
  static Future<ui.Image> getImage(String path) async {
    ByteData data = await rootBundle.load(path);
    Uint8List lst = new Uint8List.view(data.buffer);
    ui.Codec codec = await ui.instantiateImageCodec(lst);
    ui.FrameInfo info = await codec.getNextFrame();
    return info.image;
  }

  /// 获取多个图片的信息,根据图片的地址
  static Future<List<ui.Image>> getImages(Iterable<String> list) {
    return Stream.fromFutures(list.map<Future<ui.Image>>((wea) {
      return getImage(wea);
    })).toList();
  }
}
