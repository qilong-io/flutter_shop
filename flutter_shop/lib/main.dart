import 'package:bxshjdemo1/provide/counter.dart';
import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/child_category.dart';
import 'provide/category_goods_list.dart';


void main(){
  var counter = Counter();
  var childCategory = ChildCategory();
  var goodsList = CategoryGoodsListProvide();
  var providers = Providers();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(goodsList));
  runApp(ProviderNode(child: MyApp(),providers: providers));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}