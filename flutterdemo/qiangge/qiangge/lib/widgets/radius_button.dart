import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:qiangge/config/color_config.dart';

class BtnBorderRadius extends StatelessWidget {
  final String title;
  final double height;
  BtnBorderRadius(this.title,{this.height = 24});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 2, left: 5, bottom: 2, right: 5),
      height: height,
      decoration: BoxDecoration(
        color: ColorConfig.blueColor(),
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(26),
        ),
      ),
    );
  }
}
