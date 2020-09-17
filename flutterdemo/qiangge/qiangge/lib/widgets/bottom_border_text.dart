import 'package:flutter/material.dart';
import 'package:qiangge/config/color_config.dart';

class BottomLineText extends StatelessWidget {
  final String title;
  final double fontSize;
  BottomLineText(this.title, {this.fontSize = 14});
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 200),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ColorConfig.blueColor(),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: ColorConfig.blueColor(),
          fontSize: fontSize,
        ),
      ),
    );
  }
}
