import 'package:bxshjdemo1/model/cartInfo.dart';
import 'package:bxshjdemo1/provide/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {

  CartInfoModel item;

  CartCount(this.item);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _countArea(context),
          _adduceBtn(context),
        ],
      ),
    );
  }

  // 减少按钮
  Widget _reduceBtn(context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).addOrReduceAction(item, 'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(45.0),
        height: ScreenUtil().setHeight(45.0),
        alignment: Alignment.center,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: item.count >1 ? Colors.white : Colors.black12,
          border: Border(
            right: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text('-'),
      ),
    );
  }

  // 增加按钮
  Widget _adduceBtn(context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).addOrReduceAction(item, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45.0),
        height: ScreenUtil().setHeight(45.0),
        alignment: Alignment.center,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text('+'),
      ),
    );
  }

//  中间数量显示区域
  Widget _countArea(context) {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.count}'),
    );
  }
}
