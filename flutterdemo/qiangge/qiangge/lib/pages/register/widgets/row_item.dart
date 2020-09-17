import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/widgets/radius_button.dart';

class ChangeRowItem extends StatelessWidget {
  final String title;
  final String tips;
  final int type;// 1输入框 2.文字，3输入框 + 按钮
  final TextEditingController controller;
  final GestureTapCallback onTap;
  ChangeRowItem(this.title, this.tips, {this.type = 1, this.controller, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: ScreenUtil().setWidth(180),
          child: Text(
            title,
            style: TextStyle(
                color: ColorConfig.textColor2(),
                fontSize: ScreenUtil().setSp(30)),
          ),
        ),
        Expanded(
          child: _rowLeftarea(),
        ),
      ],
    );
  }

  Widget _rowLeftarea() {
    if (type == 1) {
      return _textFieldArea();
    } else if (type == 3) {
      return Row(
        children: <Widget>[
          Expanded(
            child: _textFieldArea(),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: BtnBorderRadius('获取验证码', height: 40),
            ),
          ),
        ],
      );
    } else {
      return Text(
        tips,
        style: TextStyle(
          color: ColorConfig.textColor2(),
          fontSize: ScreenUtil().setSp(28),
        ),
      );
    }
  }

  Widget _textFieldArea() {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: ColorConfig.textColor2(),
        fontSize: ScreenUtil().setSp(32),
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: tips,
        hintStyle: TextStyle(
          color: ColorConfig.textColor3(),
          fontSize: ScreenUtil().setSp(28),
        ),
        // helperText: '请输入你的真实姓名',
      ),
      // onChanged: () {},
      autofocus: false,
    );
  }
}
