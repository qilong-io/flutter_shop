import 'dart:convert';

import 'package:bxshjdemo1/service/service_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;

  List<Map> hotGoodsList = [];


//  EasyRefreshController _controller = EasyRefreshController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
//    _getHotGoods();
  }

  @override
  Widget build(BuildContext context) {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
        ),
        body: FutureBuilder(
          future: request('homePageContext', formData: formData),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var datas = json.decode(snapshot.data.toString());
              var data = datas['data'];
              List<Map> swiperDataList =
              (data['slides'] as List).cast(); // 顶部轮播组件数
              List<Map> navigatorList =
              (data['category'] as List).cast(); // 顶部导航组件数
              String adPicture =
              data['advertesPicture']['PICTURE_ADDRESS']; // 广告数据
              String leaderImage = data['shopInfo']['leaderImage']; //店长头像
              String leaderPhone = data['shopInfo']['leaderPhone']; //店长电话
              List<Map> recommendList = (data['recommend'] as List).cast();
              String floor1Title = data['floor1Pic']['PICTURE_ADDRESS'];
              List<Map> floor1GoodsList = (data['floor1'] as List).cast();
              String floor2Title = data['floor2Pic']['PICTURE_ADDRESS'];
              List<Map> floor2GoodsList = (data['floor2'] as List).cast();
              String floor3Title = data['floor3Pic']['PICTURE_ADDRESS'];
              List<Map> floor3GoodsList = (data['floor3'] as List).cast();

              return EasyRefresh(
//                controller: _controller,
                footer: ClassicalFooter(
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    noMoreText: '没有更多数据',
                    showInfo: true,
                    loadedText: '加载中...',
                    loadReadyText: '上拉加载更多',

                ),
                child: ListView(
                  children: <Widget>[
                    SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                    TopNavigator(items: navigatorList),
                    AdBanner(adPicture: adPicture),
                    LeaderPhone(
                        leaderImage: leaderImage, leaderPhone: leaderPhone),
                    Recommend(recommendList: recommendList),
                    FloorTitle(
                      picture_address: floor1Title,
                    ),
                    FloorContent(floorGoodsList: floor1GoodsList),
                    FloorTitle(
                      picture_address: floor2Title,
                    ),
                    FloorContent(floorGoodsList: floor2GoodsList),
                    FloorTitle(
                      picture_address: floor3Title,
                    ),
                    FloorContent(floorGoodsList: floor3GoodsList),
                    _hotGoods(),
                  ],
                ),
                onLoad: () async {
                  print('开始加载更多。。。。。。。。。。。。');
                  var formPage = {'page': page};
                  request('homePageBelowConten', formData: formPage).then((
                      val) {
                    var data = json.decode(val.toString());
                    List<Map> newGoodsList = (data['data'] as List).cast();
                    setState(() {
                      hotGoodsList.addAll(newGoodsList);
                      page++;
                    });
                  });
                },
              );
            } else {
              return Center(
                child: Text('加载中'),
              );
            }
          },
        ));
  }

// 获取火爆专区数据
//  void _getHotGoods() {
//    var formPage = {'page': page};
//    request('homePageBelowConten', formData: formPage).then((val) {
//      var data = json.decode(val.toString());
//      List<Map> newGoodsList = (data['data'] as List).cast();
//      setState(() {
//        hotGoodsList.addAll(newGoodsList);
//        page++;
//      });
//    });
//  }

//   火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );

//火爆专区列表
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(370.0),
                ),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: ScreenUtil().setSp(26),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['mallPrice']}'),
                    Text(
                      '￥${val['price']}',
                      style: TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('没有数据');
    }
  }

//  火爆专区
  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }
}

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDataList[index]['image']}",
              fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 上部导航部分
class TopNavigator extends StatelessWidget {
  final List items;

  TopNavigator({Key key, this.items}) : super(key: key);

  Widget _gridviewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了${item['mallCategoryName']}导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.items.length > 10) {
      this.items.removeRange(10, this.items.length);
    }
    return Container(
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: items.map((item) {
          return _gridviewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//广告部分
class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({this.adPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      child: Image.network(this.adPicture),
    );
  }
}

//店长电话模块

class LeaderPhone extends StatelessWidget {
  final String leaderImage; // 店长图像
  final String leaderPhone; // 店长电话

  LeaderPhone({this.leaderImage, this.leaderPhone});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      child: InkWell(
        onTap: _lanchUrl,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _lanchUrl() async {
    String url = 'Tel:' + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URL 不能进行访问，异常';
    }
  }
}

// 商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({this.recommendList});

//  标题方法
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //商品单独项item
  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(280),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['mallPrice']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

//  横向列表方法
  Widget _recommedList() {
//    print('推荐商品个数：${recommendList.length}');
    return Container(
      height: ScreenUtil().setHeight(280),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(330),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList(),
        ],
      ),
    );
  }
}

//楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;

  FloorTitle({this.picture_address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({this.floorGoodsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        ),
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print('点击了楼层商品');
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}
