import 'package:demo07/warp_demo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo07',
      theme: ThemeData.light(),
      home: WarpDemo(),
    );
  }
}
