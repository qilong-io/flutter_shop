import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/config/methodChanne.dart';
import 'package:qiangge/generated/i18n.dart';
import 'package:qiangge/pages/about/about_row_item.dart';
import 'package:qiangge/widgets/bottom_border_text.dart';
import 'package:qiangge/widgets/line_widget.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: ColorConfig.bgPageColor(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          I18n.of(context).about_us,
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
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Image.asset(
              'images/logo_1.png',
              width: ScreenUtil().setWidth(500),
              // height: ScreenUtil().setHeight(400),
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: PhysicalModel(
              color: ColorConfig.bgViewColor(),
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: _listArea(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: BottomLineText('软件许可服务协议'),
          ),
          Text(
            '版权所有',
            style: TextStyle(
              color: ColorConfig.textColor3(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listArea() {
    return Column(
      children: <Widget>[
        AboutRowItem(
          title: '应用版本',
          message: 'V1.025',
          onTap: () {
            print('应用版本');
          },
        ),
        LineWidget(),
        AboutRowItem(
          title: '公司简介',
          type: '1',
          onTap: () {
            print('微信公众号');
          },
        ),
        LineWidget(),
        AboutRowItem(
          title: '联系我们',
          type: '2',
          message: '18188889999',
          onTap: () {
            print('官方网址');
          },
        ),
      ],
    );
  }
}
