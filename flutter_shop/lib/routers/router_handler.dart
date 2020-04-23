import 'package:bxshjdemo1/pages/details_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// 商品详情页
Handler detailsHander = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String goodsId = params['id'].first;
    print('index > details goodsId is ${goodsId}');
    return DetailsPage(goodsId);
  },
);
