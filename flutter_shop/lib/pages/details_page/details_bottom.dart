import 'package:bxshjdemo1/provide/cart.dart';
import 'package:bxshjdemo1/provide/current_index.dart';
import 'package:bxshjdemo1/provide/details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    var count = 1;
    var price = goodsInfo.presentPrice;
    var images = goodsInfo.image1;

    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(100),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Provide.value<CurrentIndexProvide>(context).chagenIndex(2);
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
                Provide<CartProvide>(
                  builder: (context, child, val) {
                    int goodsCount =
                        Provide.value<CartProvide>(context).allGoodsCount;
                    return Positioned(
                      top: 0,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Text(
                          '${goodsCount}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(22)),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () async {
                await Provide.value<CartProvide>(context)
                    .save(goodsId, goodsName, count, price, images);
              },
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  '加入购物车',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(32),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () async {
                await Provide.value<CartProvide>(context).remove();
              },
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  '立即购买',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(32),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
