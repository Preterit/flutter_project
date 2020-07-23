import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_top_appbar.dart';

/*
 * 首页
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const List data = [
  {"title":"餐饮","url":"ic_home_item_buycar.png","rightStr":"¥598.98"},
  {"title":"交通","url":"ic_home_item_car.png","rightStr":"¥1,298.98"},
  {"title":"出行","url":"ic_home_item_food.png","rightStr":"¥59,998.98"},
  {"title":"骑车","url":"ic_home_item_buycar.png","rightStr":"¥1,000.98"},
  {"title":"购物","url":"ic_home_item_car.png","rightStr":"¥100,100.98"},
  {"title":"娱乐","url":"ic_home_item_food.png","rightStr":"¥2.98"},
  {"title":"文教","url":"ic_home_item_buycar.png","rightStr":"¥1.00"},
  {"title":"育儿","url":"ic_home_item_car.png","rightStr":"¥4.20"},
  {"title":"通讯","url":"ic_home_item_buycar.png","rightStr":"¥900.18"},
  {"title":"住房","url":"ic_home_item_food.png","rightStr":"¥598.00"},
  {"title":"零食","url":"ic_home_item_buycar.png","rightStr":"¥5.50"},
];

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0.0; // 顶部 固定 标题的 标示
  void onScrollChange(offset) {
    setState(() {
      if (offset != null) {
        appBarAlpha = offset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //白色
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: RefreshConfiguration.copyAncestor(
        context: context,
        maxOverScrollExtent: 100,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  /// 背景层
                  HomeTopBg(),

                  /// 列表数据层
                  HomeCenterWidget(onScrollChange),
                ],
              ),

              /// 滑动顶部 显示 logo
              Opacity(
                opacity: appBarAlpha,
                child: HomeTopBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
