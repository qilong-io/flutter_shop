import 'package:bxshjdemo1/model/cartInfo.dart';
import 'package:bxshjdemo1/pages/cart_page/cart_item.dart';
import 'package:bxshjdemo1/provide/cart.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List cartList = Provide
                .value<CartProvide>(context)
                .cartList;
            return ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context,index){
                return Cartitem(cartList[index]);
              },
            );
          } else {
            return Text('正在加载');
          }
        },
      ),
    );
  }


  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }


}
