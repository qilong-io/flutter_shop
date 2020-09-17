import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/config/methodChanne.dart';
import 'package:qiangge/generated/i18n.dart';

class FilesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.bgPageColor(),
        elevation: 0,
        title: Text(
          I18n.of(context).files,
          style: TextStyle(
            color: ColorConfig.textColor1(),
            fontSize: ScreenUtil().setSp(36),
          ),
        ),
        leading: InkWell(
          onTap: () {
            MethodConfig.back(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: ColorConfig.textColor1(),
            size: 30,
          ),
        ),
      ),
    );
  }
}
