import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{

  List<BxMallSubDto> childCategoryList = [];
  int chilIndex = 0;//子类高亮索引
  String categoryId = '4'; // 大类Id
  String subId = '';// 小类id
  int page = 1; // 列表页数
  String noMoreTest = '没有更多数据';


//  大类切换效果
  getChildCategory(List<BxMallSubDto> list, String id){
    page = 1;
    noMoreTest = '';
    chilIndex = 0;
    categoryId = id;
    BxMallSubDto all  = BxMallSubDto();
    all.mallSubId = '';
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
    page = 1;
    noMoreTest = '';
    notifyListeners();
  }

//  增加page的方法
  addPage(){
    page ++;
  }

  changeNoMore(String text){
    noMoreTest = text;
    notifyListeners();
  }

}