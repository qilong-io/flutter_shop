import 'package:bxshjdemo1/provide/cart.dart';
import 'package:bxshjdemo1/provide/current_index.dart';
import 'package:bxshjdemo1/routers/application.dart';
import 'package:bxshjdemo1/routers/routers.dart';
import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import 'package:bxshjdemo1/provide/child_category.dart';
import 'package:bxshjdemo1/provide/category_goods_list.dart';
import 'package:bxshjdemo1/provide/details_info.dart';
import 'package:fluro/fluro.dart';


void main(){
  var childCategory = ChildCategory();
  var goodsList = CategoryGoodsListProvide();
  var providers = Providers();
  var detailsProviders = DetailsInfoProvide();
  var cartProviders = CartProvide();
  var currentIndexProvide = CurrentIndexProvide();
  providers
    ..provide(Provider<CartProvide>.value(cartProviders))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(goodsList))
    ..provide(Provider<DetailsInfoProvide>.value(detailsProviders))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(child: MyApp(),providers: providers));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routers.configurRoutes(router);
    Application.router = router;
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}