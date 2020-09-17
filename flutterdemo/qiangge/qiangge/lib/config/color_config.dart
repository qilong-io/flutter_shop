import 'package:flutter/material.dart';

class ColorConfig {
  // static ColorConfig _colorConfig = ColorConfig._internal();
  // factory ColorConfig(){
  //   return _colorConfig;
  // }
  // ColorConfig._internal();

  static Color mainColor() {
    return Colors.white;
  }

  static Color bgPageColor() {
    return Color.fromRGBO(248, 250, 255, 1);
  }

  static Color blueColor() {
    return ColorsUtil.hexColor(0x11A3FF);
  }

  static Color bgViewColor() {
    return ColorsUtil.hexColor(0xFFFFFF);
  }

  /// 6666666
  static Color textColor1() {
    return ColorsUtil.hexColor(0x666666);
  }

  static Color textColor2() {
    return ColorsUtil.hexColor(0x333333);
  }

  static Color textColor3() {
    return ColorsUtil.hexColor(0x999999);
  }

  static Color lineColor() {
    return ColorsUtil.hexColor(0xECECEC);
  }
}

class ColorsUtil {
  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  static Color hexColor(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }
}
