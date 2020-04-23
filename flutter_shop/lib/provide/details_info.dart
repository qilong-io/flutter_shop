import 'dart:convert';
import 'package:bxshjdemo1/model/details.dart';
import 'package:bxshjdemo1/service/service_method.dart';
import 'package:flutter/material.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  bool isLeft = true;
  bool isRight = false;

//  tableBar 的切换方法
  changeleftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

//  从后台获取商品数据
  getGoodsInfo(String id) async {
    var farams = {'goodId': id};
    await request('getGoodDetailById', formData: farams).then((val) {
//      真实数据
//      var responseData = json.decode(val.toString());
      String jsonStr =
          '{"code":"0","message":"success","data":{"goodInfo":{"image5":"","amount":10000,"image3":"","image4":"","goodsId":"ed675dda49e0445fa769f3d8020ab5e9","isOnline":"yes","image1":"http://images.baixingliangfan.cn/shopGoodsImg/20190116/20190116162618_2924.jpg","image2":"","goodsSerialNumber":"6928804011173","oriPrice":3,"presentPrice":2.7,"comPic":"http://images.baixingliangfan.cn/compressedPic/20190116162618_2924.jpg","state":1,"shopId":"402880e860166f3c0160167897d60002","goodsName":"可口可乐500ml/瓶","goodsDetail":"1212312"},"goodComments":[{"SCORE":5,"comments":"果断卸载，2.5个小时才送到","userName":"157******27","discussTime":1539491266336}],"advertesPicture":{"PICTURE_ADDRESS":"http://images.baixingliangfan.cn/advertesPicture/20190113/20190113134955_5825.jpg","TO_PLACE":"1"}}}';
      var responseData = json.decode(jsonStr.toString());
      print('商品详情数据：${responseData}');
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}
