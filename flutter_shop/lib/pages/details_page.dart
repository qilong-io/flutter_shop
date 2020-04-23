import 'package:bxshjdemo1/pages/details_page/details_tabbar.dart';
import 'package:bxshjdemo1/pages/details_page/details_top_area.dart';
import 'package:bxshjdemo1/pages/details_page/details_web.dart';
import 'package:bxshjdemo1/provide/details_info.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'details_page/details_bottom.dart';
import 'details_page/details_explain.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('商品详情'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (context, snapshot) {
          print('snapshot: ${snapshot}');
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      DetailsTopArea(),
                      DetailsExplain(),
                      DetailsTabBar(),
                      DetailsWeb(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  child: DetailsBottom(),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('没有数据'),
            );
          }
        },
      ),
    );
  }

// 获取数据
  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return Provide.value<DetailsInfoProvide>(context).goodsInfo;
  }
}
