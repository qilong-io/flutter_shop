import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';

class DeviceRowItem extends StatelessWidget {
  final String title;
  final String message;
  final GestureTapCallback onTap;
  DeviceRowItem({
    this.title,
    this.message,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setHeight(80),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: ColorConfig.textColor2(),
                fontSize: ScreenUtil().setSp(28),
              ),
            ),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: ColorConfig.textColor2(),
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
            Image.asset('images/jiantou_you.png'),
          ],
        ),
      ),
    );
  }
}
