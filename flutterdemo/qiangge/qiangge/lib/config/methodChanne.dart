import 'package:flutter/services.dart';

class MethodConfig {
  static const methodChannel = const MethodChannel('com.senthink.test:about');

  static void init(context) {
    methodChannel.setMethodCallHandler((MethodCall call) {
      print('call.method : ${call.method}');
      switch (call.method.toString()) {
        case 'setSkinStleType':
          print("setSkinStleType ：${call.arguments}");
          break;
      }
      return null;
    });
  }

  static void back(context) async {
    try {
      await methodChannel.invokeMethod('finish');
    } catch (e) {
      print(e);
    }
  }
}
