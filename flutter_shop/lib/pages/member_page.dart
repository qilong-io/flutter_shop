import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: Center(
        child: Text(
          '会员中心',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
