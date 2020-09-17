import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/generated/i18n.dart';
import 'package:qiangge/pages/register/provide/register_provide.dart';
import 'package:qiangge/pages/register/widgets/chooose_item.dart';
import 'package:qiangge/widgets/line_widget.dart';

class ChooseAteaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.bgPageColor(),
        elevation: 0,
        title: Text(
          I18n.of(context).choose_area,
          style: TextStyle(
            color: ColorConfig.textColor1(),
            fontSize: ScreenUtil().setSp(36),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: ColorConfig.textColor1(),
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text(
              '请谨慎选择当前所在地区，否则可能导致软件无法正常使用',
              style: TextStyle(
                color: ColorConfig.textColor3(),
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorConfig.bgViewColor(),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: <Widget>[
                ChooseItem(
                  title: '中国大陆（推荐）',
                  onTap: () {
                    print('中国大陆');
                    Provide.value<RegisterProvide>(context).setAreaNameChina();
                    Navigator.pop(context);
                  },
                ),
                LineWidget(),
                ChooseItem(
                    title: 'English',
                    onTap: () {
                      print('English');
                      Provide.value<RegisterProvide>(context).setAreaNameEnglish();
                       Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
