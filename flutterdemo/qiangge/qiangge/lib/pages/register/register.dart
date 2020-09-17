import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/config/methodChanne.dart';
import 'package:qiangge/generated/i18n.dart';
import 'package:qiangge/pages/about/about.dart';
import 'package:qiangge/pages/register/choose_area.dart';
import 'package:qiangge/pages/register/provide/register_provide.dart';
import 'package:qiangge/pages/register/widgets/row_item.dart';
import 'package:qiangge/widgets/bottom_border_text.dart';
import 'package:qiangge/widgets/line_widget.dart';
import 'package:qiangge/widgets/row_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confimController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: ColorConfig.bgPageColor(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          I18n.of(context).register,
          style: TextStyle(
            color: ColorConfig.textColor1(),
            fontSize: ScreenUtil().setSp(36),
          ),
        ),
        leading: InkWell(
          onTap: (){
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
          InkWell(
            highlightColor: Colors.transparent,
            radius: 0,
            onTap: () {
              print('选择');
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ChooseAteaPage(),
                ),
              );
            },
            child: _chooseView(),
          ),
          _addressTip(),
          _phoneArea(),
          _passwordArea(),
          RowButton(
            '立即注册',
            () {
              print('立即注册');
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new AboutPage(),
                ),
              );
            },
          ),
          _lastArea(),
        ],
      ),
    );
  }

  Widget _chooseView() {
    return Container(
      height: ScreenUtil().setHeight(88),
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: ColorConfig.bgViewColor(),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConfig.textColor3(),
            offset: Offset(1.0, 1.0),
            blurRadius: 5.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Provide<RegisterProvide>(builder: (context, child, value) {
              return Text(
                value.areaName,
                style: TextStyle(
                    color: ColorConfig.textColor1(),
                    fontSize: ScreenUtil().setSp(28)),
              );
            }),
          ),
          Image.asset(
            'images/jiantou_you.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _addressTip() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '请选择所在地，注册成功后，国家/地区将不能被修改',
              style: TextStyle(
                color: ColorConfig.textColor3(),
                fontSize: ScreenUtil().setSp(24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneArea() {
    return Container(
      height: ScreenUtil().setHeight(181),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: PhysicalModel(
        color: ColorConfig.bgViewColor(),
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Provide<RegisterProvide>(
                builder: (context, child, value) {
                  return ChangeRowItem(
                    value.accName,
                    value.tipName,
                    controller: phoneController,
                  );
                },
              ),
            ),
            LineWidget(),
            Expanded(
              child: ChangeRowItem(
                '验证码',
                '请输入验证码',
                controller: codeController,
                type: 3,
                onTap: () {
                  print('获取验证码');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordArea() {
    return Container(
      // height: ScreenUtil().setHeight(181),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 30),
      child: PhysicalModel(
        color: ColorConfig.bgViewColor(),
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ChangeRowItem(
              '密码',
              '6-12位数字加字母',
              controller: phoneController,
            ),
            LineWidget(),
            ChangeRowItem(
              '确认密码',
              '请确保两次输入一致',
              controller: phoneController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _lastArea() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Image.asset('images/icon_xz_s.png'),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              '已查看并接受',
              style: TextStyle(
                color: ColorConfig.textColor1(),
                fontSize: ScreenUtil().setSp(24),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: BottomLineText('《软件许可服务协议》'),
            ),
          ),
        ],
      ),
    );
  }
}
