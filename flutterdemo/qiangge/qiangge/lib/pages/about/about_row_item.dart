import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/widgets/bottom_border_text.dart';

class AboutRowItem extends StatelessWidget {
  final String title;
  final String message;
  final String type; // 1右箭头，0文字
  final GestureTapCallback onTap;
  AboutRowItem({
    this.title,
    this.message,
    this.type = '0',
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(190),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: ColorConfig.textColor2(),
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
            Expanded(
              child: _leftArac(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leftArac() {
    if (type == '0') {
      return Text(
        message,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: ColorConfig.textColor2(),
          fontSize: ScreenUtil().setSp(28),
        ),
      );
    } else if (type == '1') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.keyboard_arrow_right,
            color: ColorConfig.textColor3(),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BottomLineText('12255667788'),
        ],
      );
    }
  }
}
