import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provide/provide.dart';
import 'package:qiangge/config/color_config.dart';
import 'package:qiangge/config/methodChanne.dart';
import 'package:qiangge/generated/i18n.dart';
import 'package:qiangge/pages/about/about.dart';
import 'package:qiangge/pages/device/deviec.dart';
import 'package:qiangge/pages/files/files.dart';
import 'package:qiangge/pages/register/provide/register_provide.dart';
import 'package:qiangge/pages/register/register.dart';

void main() {
  final provides = Providers()
    ..provide(Provider<RegisterProvide>.value(RegisterProvide()));
  runApp(ProviderNode(
    child: MyApp(router: window.defaultRouteName),
    providers: provides,
  ));
}

class MyApp extends StatelessWidget {
  final String router;
  MyApp({this.router});
  @override
  Widget build(BuildContext context) {
    MethodConfig.init(context);
    return MaterialApp(
      localizationsDelegates: [
        I18n.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primaryColor: ColorConfig.mainColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: _home(),
    );
  }

  Widget _home() {
    switch (router) {
      case 'about':
        return AboutPage();
        break;
      case 'files':
        return FilesPage();
        break;
      case 'register':
        return RegisterPage();
        break;
      case 'device':
        return DeviecPage();
        break;
      default:
        return DeviecPage();
        break;
    }
  }


}
