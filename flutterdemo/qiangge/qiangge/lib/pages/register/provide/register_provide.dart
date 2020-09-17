import 'package:flutter/material.dart';

class RegisterProvide with ChangeNotifier {
  String areaName = '中国大陆（推荐）';
  String accName = '手机号';
  String tipName = '请输入手机号';
  bool isPhone = true;

  setAreaNameChina() {
    areaName = '中国大陆（推荐）';
    accName = '手机号';
    tipName = '请输入手机号';
    notifyListeners();
  }

  setAreaNameEnglish() {
    areaName = 'Ehglish';
    accName = '邮箱号';
    tipName = '请输入邮箱号';
    notifyListeners();
  }

  
}
