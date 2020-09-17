import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';

class ChooseItem extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  ChooseItem({
    this.title,
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
            Expanded(
              child: Text(
                title,
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
