import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/config/methodChanne.dart';
import 'package:qiangge/generated/i18n.dart';
import 'package:qiangge/pages/device/device_row.dart';
import 'package:qiangge/pages/register/widgets/chooose_item.dart';
import 'package:qiangge/widgets/line_widget.dart';
import 'package:qiangge/widgets/row_button.dart';

class DeviecPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: ColorConfig.bgPageColor(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          I18n.of(context).device_detail,
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
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: PhysicalModel(
              color: ColorConfig.bgViewColor(),
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  children: <Widget>[
                    ChooseItem(title: '设备信息'),
                    LineWidget(),
                    DeviceRowItem(title:'重命名',message:'智能保险箱1号',onTap: (){}),
                    LineWidget(),
                    ChooseItem(title: '修改网络'),
                    LineWidget(),
                    ChooseItem(title: '添加IOT设备'),
                    LineWidget(),
                    ChooseItem(title: 'OTA升级'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: RowButton(
              '删除设备',
              () {},
              bgColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
