import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentIndexProvide with ChangeNotifier{
  int currentIndex = 0;

  chagenIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }

}