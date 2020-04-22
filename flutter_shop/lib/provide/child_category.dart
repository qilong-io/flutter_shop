import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{

  List<BxMallSubDto> childCategoryList = [];
  int chilIndex = 0;//子类高亮索引
  String categoryId = '4'; // 大类Id
  String subId = '';// 小类id

//  大类切换效果
  getChildCategory(List<BxMallSubDto> list, String id){
    chilIndex = 0;
    categoryId = id;
    BxMallSubDto all  = BxMallSubDto();
    all.mallSubId = '00';
    all.mallSubName = '全部';
    all.mallCategoryId = '00';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

//  改变子类索引
  changeChildIndex(index,String id){
    chilIndex = index;
    subId = id;
    notifyListeners();
  }

}