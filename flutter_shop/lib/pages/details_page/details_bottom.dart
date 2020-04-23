import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(100),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
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
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {},
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
              onTap: () {},
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
