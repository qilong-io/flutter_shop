import 'package:flutter/material.dart';

class ToolTipsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo')),
      body: Center(
        child: Tooltip(
          message: '不要碰我，我怕痒!',
          child: Image.network(
              'http://pic1.win4000.com/wallpaper/2018-02-01/5a72d6ee6b46f.jpg'),
        ),
      ),
    );
  }
}
