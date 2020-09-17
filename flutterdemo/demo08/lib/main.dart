import 'package:demo08/expansion_panel_list.dart';
import 'package:demo08/expansion_tile.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
//      home: ExpansionTileDemo(),
      home: ExpansionPanelListDemo(),
    );
  }
}
