import 'dart:convert';

import 'package:bxshjdemo1/provide/category_goods_list.dart';
import 'package:bxshjdemo1/provide/child_category.dart';
import 'package:bxshjdemo1/routers/application.dart';
import 'package:bxshjdemo1/service/service_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

import '../model/category.dart';
import '../model/categoryGoodsList.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
                CategoryGoods(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0;

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _leftInkWell(index);
          },
        ),
      ),
    );
  }

  Widget _leftInkWell(int index) {
    bool isclick = false;
    isclick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
        });
        print('点击了${(list[index] as Data).mallCategoryName}');
        var childList = (list[index] as Data).bxMallSubDto;
        var ctaegoryId = (list[index] as Data).mallCategoryId;
        Provide.value<ChildCategory>(context)
            .getChildCategory(childList, ctaegoryId);
        _getBigGoodsList(categoryId: ctaegoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isclick ? Color.fromRGBO(236, 236, 236, 1.0) : Colors.white,
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.black12),
            )),
        child: Text(
          (list[index] as Data).mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(32)),
        ),
      ),
    );
  }

  void _getCategory() {
// 正规网络请求数据
    request('getCategory').then((val) {
//      真数据
//      var data = json.decode(val.toString());
      String jsonStr =
          '{"code":"0","message":"success","data":[{"mallCategoryId":"4","mallCategoryName":"白酒","bxMallSubDto":[{"mallSubId":"2c9f6c94621970a801626a35cb4d0175","mallCategoryId":"4","mallSubName":"名酒","comments":""},{"mallSubId":"2c9f6c94621970a801626a363e5a0176","mallCategoryId":"4","mallSubName":"宝丰","comments":""},{"mallSubId":"2c9f6c94621970a801626a3770620177","mallCategoryId":"4","mallSubName":"北京二锅头","comments":""},{"mallSubId":"2c9f6c94679b4fb10167f7cc035c15a8","mallCategoryId":"4","mallSubName":"大明","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cc2af915a9","mallCategoryId":"4","mallSubName":"杜康","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cc535115aa","mallCategoryId":"4","mallSubName":"顿丘","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cc77b215ab","mallCategoryId":"4","mallSubName":"汾酒","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cca72e15ac","mallCategoryId":"4","mallSubName":"枫林","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cccae215ad","mallCategoryId":"4","mallSubName":"高粱酒","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7ccf0d915ae","mallCategoryId":"4","mallSubName":"古井","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cd1d6715af","mallCategoryId":"4","mallSubName":"贵州大曲","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cd3f2815b0","mallCategoryId":"4","mallSubName":"国池","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cd5d3015b1","mallCategoryId":"4","mallSubName":"国窖","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cd7ced15b2","mallCategoryId":"4","mallSubName":"国台","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cd9b9015b3","mallCategoryId":"4","mallSubName":"汉酱","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cdbfd215b4","mallCategoryId":"4","mallSubName":"红星","comments":null},{"mallSubId":"2c9f6c946891d16801689474e2a70081","mallCategoryId":"4","mallSubName":"怀庄","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cdddf815b5","mallCategoryId":"4","mallSubName":"剑南春","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cdfd4815b6","mallCategoryId":"4","mallSubName":"江小白","comments":null},{"mallSubId":"2c9f6c94679b4fb1016802277c37160e","mallCategoryId":"4","mallSubName":"金沙","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7ce207015b7","mallCategoryId":"4","mallSubName":"京宫","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7ce46d415b8","mallCategoryId":"4","mallSubName":"酒鬼","comments":null},{"mallSubId":"2c9f6c94679b4fb101680226de23160d","mallCategoryId":"4","mallSubName":"口子窖","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7ce705515b9","mallCategoryId":"4","mallSubName":"郎酒","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7ce989e15ba","mallCategoryId":"4","mallSubName":"老口子","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cec30915bb","mallCategoryId":"4","mallSubName":"龙江家园","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cef15c15bc","mallCategoryId":"4","mallSubName":"泸州","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cf156f15bd","mallCategoryId":"4","mallSubName":"鹿邑大曲","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cf425b15be","mallCategoryId":"4","mallSubName":"毛铺","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cf9dc915c0","mallCategoryId":"4","mallSubName":"绵竹","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cfbf1c15c1","mallCategoryId":"4","mallSubName":"难得糊涂","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cfdd7215c2","mallCategoryId":"4","mallSubName":"牛二爷","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7cf71e715bf","mallCategoryId":"4","mallSubName":"茅台","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7d7eda715c3","mallCategoryId":"4","mallSubName":"绵竹","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7d96e5c15c4","mallCategoryId":"4","mallSubName":"难得糊涂","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dab93b15c5","mallCategoryId":"4","mallSubName":"牛二爷","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dae16415c6","mallCategoryId":"4","mallSubName":"牛栏山","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7db11cb15c7","mallCategoryId":"4","mallSubName":"前门","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7db430c15c8","mallCategoryId":"4","mallSubName":"全兴","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7db6cac15c9","mallCategoryId":"4","mallSubName":"舍得","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7db9a4415ca","mallCategoryId":"4","mallSubName":"双沟","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dc30b815cb","mallCategoryId":"4","mallSubName":"水井坊","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dc543e15cc","mallCategoryId":"4","mallSubName":"四特","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dc765c15cd","mallCategoryId":"4","mallSubName":"潭酒","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dc988a15ce","mallCategoryId":"4","mallSubName":"沱牌","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dcba5a15cf","mallCategoryId":"4","mallSubName":"五粮液","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dcd9e815d0","mallCategoryId":"4","mallSubName":"西凤","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dcf6d715d1","mallCategoryId":"4","mallSubName":"习酒","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dd11b215d2","mallCategoryId":"4","mallSubName":"小白杨","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dd2f3c15d3","mallCategoryId":"4","mallSubName":"洋河","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7dd969115d4","mallCategoryId":"4","mallSubName":"伊力特","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7ddb16c15d5","mallCategoryId":"4","mallSubName":"张弓","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7ddd6c715d6","mallCategoryId":"4","mallSubName":"中粮","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7de126815d7","mallCategoryId":"4","mallSubName":"竹叶青","comments":null}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170036_4477.png"},{"mallCategoryId":"1","mallCategoryName":"啤酒","bxMallSubDto":[{"mallSubId":"2c9f6c946016ea9b016016f79c8e0000","mallCategoryId":"1","mallSubName":"百威","comments":""},{"mallSubId":"2c9f6c94608ff843016095163b8c0177","mallCategoryId":"1","mallSubName":"福佳","comments":""},{"mallSubId":"402880e86016d1b5016016db9b290001","mallCategoryId":"1","mallSubName":"哈尔滨","comments":""},{"mallSubId":"402880e86016d1b5016016dbff2f0002","mallCategoryId":"1","mallSubName":"汉德","comments":""},{"mallSubId":"2c9f6c946449ea7e01647cd6830e0022","mallCategoryId":"1","mallSubName":"崂山","comments":""},{"mallSubId":"2c9f6c946449ea7e01647cd706a60023","mallCategoryId":"1","mallSubName":"林德曼","comments":""},{"mallSubId":"2c9f6c94679b4fb10167f7e1411b15d8","mallCategoryId":"1","mallSubName":"青岛","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e1647215d9","mallCategoryId":"1","mallSubName":"三得利","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e182e715da","mallCategoryId":"1","mallSubName":"乌苏","comments":null},{"mallSubId":"2c9f6c9468118c9c016811ab16bf0001","mallCategoryId":"1","mallSubName":"雪花","comments":null},{"mallSubId":"2c9f6c9468118c9c016811aa6f440000","mallCategoryId":"1","mallSubName":"燕京","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e19b8f15db","mallCategoryId":"1","mallSubName":"智美","comments":null}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170044_9165.png"},{"mallCategoryId":"2","mallCategoryName":"葡萄酒","bxMallSubDto":[{"mallSubId":"2c9f6c9460337d540160337fefd60000","mallCategoryId":"2","mallSubName":"澳大利亚","comments":""},{"mallSubId":"402880e86016d1b5016016e083f10010","mallCategoryId":"2","mallSubName":"德国","comments":""},{"mallSubId":"402880e86016d1b5016016df1f92000c","mallCategoryId":"2","mallSubName":"法国","comments":""},{"mallSubId":"2c9f6c94621970a801626a40feac0178","mallCategoryId":"2","mallSubName":"南非","comments":""},{"mallSubId":"2c9f6c94679b4fb10167f7e5c9a115dc","mallCategoryId":"2","mallSubName":"葡萄牙","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e5e68f15dd","mallCategoryId":"2","mallSubName":"西班牙","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e609f515de","mallCategoryId":"2","mallSubName":"新西兰","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e6286a15df","mallCategoryId":"2","mallSubName":"意大利","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e6486615e0","mallCategoryId":"2","mallSubName":"智利","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7e66c6815e1","mallCategoryId":"2","mallSubName":"中国","comments":null}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170053_878.png"},{"mallCategoryId":"3","mallCategoryName":"清酒洋酒","bxMallSubDto":[{"mallSubId":"402880e86016d1b5016016e135440011","mallCategoryId":"3","mallSubName":"清酒","comments":""},{"mallSubId":"402880e86016d1b5016016e171cc0012","mallCategoryId":"3","mallSubName":"洋酒","comments":""}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170101_6957.png"},{"mallCategoryId":"5","mallCategoryName":"保健酒","bxMallSubDto":[{"mallSubId":"2c9f6c94609a62be0160a02d1dc20021","mallCategoryId":"5","mallSubName":"黄酒","comments":""},{"mallSubId":"2c9f6c94648837980164883ff6980000","mallCategoryId":"5","mallSubName":"药酒","comments":""}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170110_6581.png"},{"mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b","mallCategoryName":"预调酒","bxMallSubDto":[{"mallSubId":"2c9f6c946449ea7e01647d02f6250026","mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b","mallSubName":"果酒","comments":""},{"mallSubId":"2c9f6c946449ea7e01647d031bae0027","mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b","mallSubName":"鸡尾酒","comments":""},{"mallSubId":"2c9f6c946449ea7e01647d03428f0028","mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b","mallSubName":"米酒","comments":""}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170124_4760.png"},{"mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d","mallCategoryName":"下酒小菜","bxMallSubDto":[{"mallSubId":"2c9f6c946449ea7e01647dc18e610035","mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d","mallSubName":"熟食","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dc1d9070036","mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d","mallSubName":"火腿","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dc1fc3e0037","mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d","mallSubName":"速冻食品","comments":""}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170133_4419.png"},{"mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c","mallCategoryName":"饮料","bxMallSubDto":[{"mallSubId":"2c9f6c946449ea7e01647d09cbf6002d","mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c","mallSubName":"茶饮","comments":""},{"mallSubId":"2c9f6c946449ea7e01647d09f7e8002e","mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c","mallSubName":"水饮","comments":""},{"mallSubId":"2c9f6c946449ea7e01647d0a27e1002f","mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c","mallSubName":"功能饮料","comments":""},{"mallSubId":"2c9f6c946449ea7e01647d0b1d4d0030","mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c","mallSubName":"果汁","comments":""},{"mallSubId":"2c9f6c946449ea7e01647d14192b0031","mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c","mallSubName":"含乳饮料","comments":""},{"mallSubId":"2c9f6c946449ea7e01647d24d9600032","mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c","mallSubName":"碳酸饮料","comments":""}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170143_361.png"},{"mallCategoryId":"2c9f6c946449ea7e01647cd108b60020","mallCategoryName":"乳制品","bxMallSubDto":[{"mallSubId":"2c9f6c946449ea7e01647dd4ac8c0048","mallCategoryId":"2c9f6c946449ea7e01647cd108b60020","mallSubName":"常温纯奶","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dd4f6a40049","mallCategoryId":"2c9f6c946449ea7e01647cd108b60020","mallSubName":"常温酸奶","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dd51ab7004a","mallCategoryId":"2c9f6c946449ea7e01647cd108b60020","mallSubName":"低温奶","comments":""}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170151_9234.png"},{"mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallCategoryName":"休闲零食","bxMallSubDto":[{"mallSubId":"2c9f6c946449ea7e01647dc51d93003c","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"方便食品","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dd204dc0040","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"面包糕点","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dd22f760041","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"糖果巧克力","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dd254530042","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"膨化食品","comments":""},{"mallSubId":"2c9f6c94679b4fb10167f7fa132b15e7","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"坚果炒货","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7f4bfc415e2","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"肉干豆干","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7f5027a15e3","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"饼干","comments":null},{"mallSubId":"2c9f6c94679b4fb10167f7f530fd15e4","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"冲调","comments":null},{"mallSubId":"2c9f6c94683a6b0d016846b49436003b","mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e","mallSubName":"休闲水果","comments":null}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190131/20190131170200_7553.png"},{"mallCategoryId":"2c9f6c946449ea7e01647cd08369001f","mallCategoryName":"粮油调味","bxMallSubDto":[{"mallSubId":"2c9f6c946449ea7e01647dd2e8270043","mallCategoryId":"2c9f6c946449ea7e01647cd08369001f","mallSubName":"油/粮食","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dd31bca0044","mallCategoryId":"2c9f6c946449ea7e01647cd08369001f","mallSubName":"调味品","comments":""},{"mallSubId":"2c9f6c946449ea7e01647dd35a980045","mallCategoryId":"2c9f6c946449ea7e01647cd08369001f","mallSubName":"酱菜罐头","comments":""}],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20181212/20181212115842_9733.png"},{"mallCategoryId":"2c9f6c9468a85aef016925444ddb271b","mallCategoryName":"积分商品","bxMallSubDto":[],"comments":null,"image":"http://images.baixingliangfan.cn/firstCategoryPicture/20190225/20190225232703_9950.png"}]}';
      var data = json.decode(jsonStr);
      print('分类数据======>$data');
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      print('点击了${(list[0] as Data).mallCategoryName}');
      var childList = (list[0] as Data).bxMallSubDto;
      var categoruId = (list[0] as Data).mallCategoryId;
      Provide.value<ChildCategory>(context)
          .getChildCategory(childList, categoruId);
      _getBigGoodsList(categoryId: categoruId);
    });
  }

  // 获取数据
  void _getBigGoodsList({String categoryId}) {
    var data = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': '',
      'page': 1
    };

    request('getMallGoods', formData: data).then((val) {
//      真正数据
//      var data = json.decode(val.toString());
      String jsonStr =
          '{"code":"0","message":"success","data":[{"image":"http://images.baixingliangfan.cn/compressedPic/20190116145309_40.jpg","oriPrice":2.50,"presentPrice":1.80,"goodsName":"哈尔滨冰爽啤酒330ml","goodsId":"3194330cf25f43c3934dbb8c2a964ade"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190115185215_1051.jpg","oriPrice":2.00,"presentPrice":1.80,"goodsName":"燕京啤酒8°330ml","goodsId":"522a3511f4c545ab9547db074bb51579"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121102419_9362.jpg","oriPrice":1.98,"presentPrice":1.80,"goodsName":"崂山清爽8°330ml","goodsId":"bbdbd5028cc849c2998ff84fb55cb934"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181330_9746.jpg","oriPrice":2.50,"presentPrice":1.90,"goodsName":"雪花啤酒8°清爽330ml","goodsId":"87013c4315e54927a97e51d0645ece76"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180233_4501.jpg","oriPrice":2.50,"presentPrice":2.20,"goodsName":"崂山啤酒8°330ml","goodsId":"86388a0ee7bd4a9dbe79f4a38c8acc89"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164250_1839.jpg","oriPrice":2.50,"presentPrice":2.30,"goodsName":"哈尔滨小麦王10°330ml","goodsId":"d31a5a337d43433385b17fe83ce2676a"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181139_2653.jpg","oriPrice":2.70,"presentPrice":2.50,"goodsName":"三得利清爽啤酒10°330ml","goodsId":"74a1fb6adc1f458bb6e0788c4859bf54"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121162731_3928.jpg","oriPrice":2.75,"presentPrice":2.50,"goodsName":"三得利啤酒7.5度超纯啤酒330ml","goodsId":"d52fa8ba9a5f40e6955be9e28a764f34"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180452_721.jpg","oriPrice":4.50,"presentPrice":3.70,"goodsName":"青岛啤酒11°330ml","goodsId":"a42c0585015540efa7e9642ec1183940"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121170407_7423.jpg","oriPrice":4.40,"presentPrice":4.00,"goodsName":"三得利清爽啤酒500ml 10.0°","goodsId":"94ec3df73f4446b5a5f0d80a8e51eb9d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181427_6101.jpg","oriPrice":4.50,"presentPrice":4.00,"goodsName":"雪花勇闯天涯啤酒8°330ml","goodsId":"d80462faab814ac6a7124cec3b868cf7"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151537_3425.jpg","oriPrice":4.90,"presentPrice":4.10,"goodsName":"百威啤酒听装9.7°330ml","goodsId":"91a849140de24546b0de9e23d85399a3"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121101926_2942.jpg","oriPrice":4.95,"presentPrice":4.50,"goodsName":"崂山啤酒8°500ml","goodsId":"3758bbd933b145f2a9c472bf76c4920c"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175422_518.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"百威3.6%大瓶9.7°P460ml","goodsId":"dc32954b66814f40977be0255cfdacca"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151454_4834.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"青岛啤酒大听装500ml","goodsId":"fc85510c3af7428dbf1cb0c1bcb43711"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181007_4229.jpg","oriPrice":5.50,"presentPrice":5.00,"goodsName":"三得利金纯生啤酒580ml 9°","goodsId":"14bd89f066ca4949af5e4d5a1d2afaf8"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121100752_4292.jpg","oriPrice":6.60,"presentPrice":6.00,"goodsName":"哈尔滨啤酒冰纯白啤（小麦啤酒）500ml","goodsId":"89bccd56a8e9465692ccc469cd4b442e"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175656_777.jpg","oriPrice":7.20,"presentPrice":6.60,"goodsName":"百威啤酒500ml","goodsId":"3a94dea560ef46008dad7409d592775d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180754_2838.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛啤酒皮尔森10.5°330ml","goodsId":"97adb29137fb47689146a397e5351926"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164149_2165.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛全麦白啤11°500ml","goodsId":"f78826d3eb0546f6a2e58893d4a41b43"}]}';
      var data = json.decode(jsonStr);
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsList.data);
      print(
          '商品列表11111111-------------->${(goodsList.data[0] as CategoryListData).goodsName}');
    });
  }
}

//小类别 右侧上边导航
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(
                  childCategory.childCategoryList[index], index);
            },
          ),
        );
      },
    );
  }

  Widget _rightInkWell(BxMallSubDto item, index) {
    bool isclick = false;
    isclick = (Provide.value<ChildCategory>(context).chilIndex == index)
        ? true
        : false;
    return InkWell(
      onTap: () {
        Provide.value<ChildCategory>(context)
            .changeChildIndex(index, item.mallCategoryId);
        _getGoodsList(item.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
        color: Colors.white,
        child: Text(
          (item as BxMallSubDto).mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(32),
            color: isclick ? Colors.pinkAccent : Colors.black,
          ),
        ),
      ),
    );
  }

  // 获取数据
  void _getGoodsList(String categorySubId) {
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };

    request('getMallGoods', formData: data).then((val) {
//      真数据
//      var data = json.decode(val.toString());
      String jsonStr =
          '{"code":"0","message":"success","data":[{"image":"http://images.baixingliangfan.cn/compressedPic/20190116145309_40.jpg","oriPrice":2.50,"presentPrice":1.80,"goodsName":"哈尔滨冰爽啤酒330ml","goodsId":"3194330cf25f43c3934dbb8c2a964ade"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190115185215_1051.jpg","oriPrice":2.00,"presentPrice":1.80,"goodsName":"燕京啤酒8°330ml","goodsId":"522a3511f4c545ab9547db074bb51579"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121102419_9362.jpg","oriPrice":1.98,"presentPrice":1.80,"goodsName":"崂山清爽8°330ml","goodsId":"bbdbd5028cc849c2998ff84fb55cb934"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181330_9746.jpg","oriPrice":2.50,"presentPrice":1.90,"goodsName":"雪花啤酒8°清爽330ml","goodsId":"87013c4315e54927a97e51d0645ece76"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180233_4501.jpg","oriPrice":2.50,"presentPrice":2.20,"goodsName":"崂山啤酒8°330ml","goodsId":"86388a0ee7bd4a9dbe79f4a38c8acc89"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164250_1839.jpg","oriPrice":2.50,"presentPrice":2.30,"goodsName":"哈尔滨小麦王10°330ml","goodsId":"d31a5a337d43433385b17fe83ce2676a"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181139_2653.jpg","oriPrice":2.70,"presentPrice":2.50,"goodsName":"三得利清爽啤酒10°330ml","goodsId":"74a1fb6adc1f458bb6e0788c4859bf54"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121162731_3928.jpg","oriPrice":2.75,"presentPrice":2.50,"goodsName":"三得利啤酒7.5度超纯啤酒330ml","goodsId":"d52fa8ba9a5f40e6955be9e28a764f34"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180452_721.jpg","oriPrice":4.50,"presentPrice":3.70,"goodsName":"青岛啤酒11°330ml","goodsId":"a42c0585015540efa7e9642ec1183940"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121170407_7423.jpg","oriPrice":4.40,"presentPrice":4.00,"goodsName":"三得利清爽啤酒500ml 10.0°","goodsId":"94ec3df73f4446b5a5f0d80a8e51eb9d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181427_6101.jpg","oriPrice":4.50,"presentPrice":4.00,"goodsName":"雪花勇闯天涯啤酒8°330ml","goodsId":"d80462faab814ac6a7124cec3b868cf7"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151537_3425.jpg","oriPrice":4.90,"presentPrice":4.10,"goodsName":"百威啤酒听装9.7°330ml","goodsId":"91a849140de24546b0de9e23d85399a3"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121101926_2942.jpg","oriPrice":4.95,"presentPrice":4.50,"goodsName":"崂山啤酒8°500ml","goodsId":"3758bbd933b145f2a9c472bf76c4920c"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175422_518.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"百威3.6%大瓶9.7°P460ml","goodsId":"dc32954b66814f40977be0255cfdacca"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151454_4834.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"青岛啤酒大听装500ml","goodsId":"fc85510c3af7428dbf1cb0c1bcb43711"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181007_4229.jpg","oriPrice":5.50,"presentPrice":5.00,"goodsName":"三得利金纯生啤酒580ml 9°","goodsId":"14bd89f066ca4949af5e4d5a1d2afaf8"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121100752_4292.jpg","oriPrice":6.60,"presentPrice":6.00,"goodsName":"哈尔滨啤酒冰纯白啤（小麦啤酒）500ml","goodsId":"89bccd56a8e9465692ccc469cd4b442e"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175656_777.jpg","oriPrice":7.20,"presentPrice":6.60,"goodsName":"百威啤酒500ml","goodsId":"3a94dea560ef46008dad7409d592775d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180754_2838.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛啤酒皮尔森10.5°330ml","goodsId":"97adb29137fb47689146a397e5351926"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164149_2165.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛全麦白啤11°500ml","goodsId":"f78826d3eb0546f6a2e58893d4a41b43"}]}';
      var data = json.decode(jsonStr);
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getGoodsList(goodsList.data);
      }

      print(
          '商品列表22222222-------------->${(goodsList.data[0] as CategoryListData).goodsName}');
    });
  }
}

//商品列表
class CategoryGoods extends StatefulWidget {
  @override
  _CategoryGoodsState createState() => _CategoryGoodsState();
}

class _CategoryGoodsState extends State<CategoryGoods> {
  var scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, data) {
        try {
          if (Provide.value<ChildCategory>(context).page == 1) {
//            列表位置放到最上边
            scrollController.jumpTo(0.0);
            print('回到顶部');
          }
        } catch (e) {
          print('第一次进入界面$e');
        }

        if (data.goodsList.length > 0) {
          return Expanded(
            child: Container(
              width: ScreenUtil().setWidth(570),
              child: EasyRefresh(
                footer: ClassicalFooter(
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  noMoreText: Provide.value<ChildCategory>(context).noMoreTest,
                  showInfo: true,
                  loadedText: '加载中...',
                  loadReadyText: '上拉加载更多',
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: data.goodsList.length,
                  itemBuilder: (context, index) {
                    return _listItemWidget(data.goodsList, index);
                  },
                ),
                onLoad: () async {
                  print('上拉加载更多');
                  _getMoreList();
                },
              ),
            ),
          );
        } else {
          return Text('暂时没有数据');
        }
      },
    );
  }

  // 获取数据
  void _getMoreList() {
    Provide.value<ChildCategory>(context).addPage();
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': Provide.value<ChildCategory>(context).subId,
      'page': Provide.value<ChildCategory>(context).page,
    };

    request('getMallGoods', formData: data).then((val) {
//      真数据
//      var data = json.decode(val.toString());
      String jsonStr =
          '{"code":"0","message":"success","data":[{"image":"http://images.baixingliangfan.cn/compressedPic/20190116145309_40.jpg","oriPrice":2.50,"presentPrice":1.80,"goodsName":"哈尔滨冰爽啤酒330ml","goodsId":"3194330cf25f43c3934dbb8c2a964ade"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190115185215_1051.jpg","oriPrice":2.00,"presentPrice":1.80,"goodsName":"燕京啤酒8°330ml","goodsId":"522a3511f4c545ab9547db074bb51579"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121102419_9362.jpg","oriPrice":1.98,"presentPrice":1.80,"goodsName":"崂山清爽8°330ml","goodsId":"bbdbd5028cc849c2998ff84fb55cb934"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181330_9746.jpg","oriPrice":2.50,"presentPrice":1.90,"goodsName":"雪花啤酒8°清爽330ml","goodsId":"87013c4315e54927a97e51d0645ece76"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180233_4501.jpg","oriPrice":2.50,"presentPrice":2.20,"goodsName":"崂山啤酒8°330ml","goodsId":"86388a0ee7bd4a9dbe79f4a38c8acc89"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164250_1839.jpg","oriPrice":2.50,"presentPrice":2.30,"goodsName":"哈尔滨小麦王10°330ml","goodsId":"d31a5a337d43433385b17fe83ce2676a"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181139_2653.jpg","oriPrice":2.70,"presentPrice":2.50,"goodsName":"三得利清爽啤酒10°330ml","goodsId":"74a1fb6adc1f458bb6e0788c4859bf54"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121162731_3928.jpg","oriPrice":2.75,"presentPrice":2.50,"goodsName":"三得利啤酒7.5度超纯啤酒330ml","goodsId":"d52fa8ba9a5f40e6955be9e28a764f34"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180452_721.jpg","oriPrice":4.50,"presentPrice":3.70,"goodsName":"青岛啤酒11°330ml","goodsId":"a42c0585015540efa7e9642ec1183940"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121170407_7423.jpg","oriPrice":4.40,"presentPrice":4.00,"goodsName":"三得利清爽啤酒500ml 10.0°","goodsId":"94ec3df73f4446b5a5f0d80a8e51eb9d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181427_6101.jpg","oriPrice":4.50,"presentPrice":4.00,"goodsName":"雪花勇闯天涯啤酒8°330ml","goodsId":"d80462faab814ac6a7124cec3b868cf7"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151537_3425.jpg","oriPrice":4.90,"presentPrice":4.10,"goodsName":"百威啤酒听装9.7°330ml","goodsId":"91a849140de24546b0de9e23d85399a3"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121101926_2942.jpg","oriPrice":4.95,"presentPrice":4.50,"goodsName":"崂山啤酒8°500ml","goodsId":"3758bbd933b145f2a9c472bf76c4920c"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175422_518.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"百威3.6%大瓶9.7°P460ml","goodsId":"dc32954b66814f40977be0255cfdacca"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180717151454_4834.jpg","oriPrice":5.00,"presentPrice":4.50,"goodsName":"青岛啤酒大听装500ml","goodsId":"fc85510c3af7428dbf1cb0c1bcb43711"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712181007_4229.jpg","oriPrice":5.50,"presentPrice":5.00,"goodsName":"三得利金纯生啤酒580ml 9°","goodsId":"14bd89f066ca4949af5e4d5a1d2afaf8"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190121100752_4292.jpg","oriPrice":6.60,"presentPrice":6.00,"goodsName":"哈尔滨啤酒冰纯白啤（小麦啤酒）500ml","goodsId":"89bccd56a8e9465692ccc469cd4b442e"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712175656_777.jpg","oriPrice":7.20,"presentPrice":6.60,"goodsName":"百威啤酒500ml","goodsId":"3a94dea560ef46008dad7409d592775d"},{"image":"http://images.baixingliangfan.cn/compressedPic/20180712180754_2838.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛啤酒皮尔森10.5°330ml","goodsId":"97adb29137fb47689146a397e5351926"},{"image":"http://images.baixingliangfan.cn/compressedPic/20190116164149_2165.jpg","oriPrice":7.78,"presentPrice":7.00,"goodsName":"青岛全麦白啤11°500ml","goodsId":"f78826d3eb0546f6a2e58893d4a41b43"}]}';
      var data = json.decode(jsonStr);
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Fluttertoast.showToast(
          msg: '已经到底了',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,//提示位置
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Provide.value<ChildCategory>(context).changeNoMore('没有更多数据了');
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getMoreList(goodsList.data);
      }

      print(
          '商品列表22222222-------------->${(goodsList.data[0] as CategoryListData).goodsName}');
    });
  }

//  商品图片
  Widget _goodsImage(List dataList, index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network((dataList[index] as CategoryListData).image),
    );
  }

  Widget _goodsName(List dataList, index) {
    return Container(
      width: ScreenUtil().setWidth(370),
      padding: EdgeInsets.all(5.0),
      child: Text(
        (dataList[index] as CategoryListData).goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _goodsPrice(List dataList, index) {
    return Container(
      width: ScreenUtil().setWidth(370),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
            '价格￥${(dataList[index] as CategoryListData).presentPrice}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(32),
            ),
          ),
          Text(
            '￥${(dataList[index] as CategoryListData).oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItemWidget(List dataList, index) {
    return InkWell(
      onTap: () {
        print('分类界面点击了商品${(dataList[index] as CategoryListData).goodsId}');
        String goodsId = (dataList[index] as CategoryListData).goodsId;
        Application.router.navigateTo(context, '/detail?id=${goodsId}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(dataList, index),
            Column(
              children: <Widget>[
                _goodsName(dataList, index),
                _goodsPrice(dataList, index),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
