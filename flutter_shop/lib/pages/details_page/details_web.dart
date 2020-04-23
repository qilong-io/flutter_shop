import 'package:bxshjdemo1/provide/details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var goodsDetails = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goodsDetails =
        "\<img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_5060.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_1063.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /> <img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8029.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_1074.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8439.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_6800.jpg\" width=\"100%\" height=\"auto\" alt=\"\" />";
    return Provide<DetailsInfoProvide>(
      builder: (context, child, val) {
        var isLeft = Provide.value<DetailsInfoProvide>(context).isLeft;
        if (isLeft == true) {
          return Container(
            child: Html(
              data: goodsDetails,
            ),
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text('没有数据'),
          );
        }
      },
    );
  }
}
