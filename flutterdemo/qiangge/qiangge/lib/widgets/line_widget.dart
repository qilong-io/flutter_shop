import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';


class LineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.lineColor(),
      height: ScreenUtil().setHeight(0.5),
    );
  }
}
