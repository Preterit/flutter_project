/*
* Date:2020/7/23
* author:lwb
* Desc: 账单页面 - 内容区域
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/routes/home_route/home_Item.dart';
import 'package:flutterproject/util/imgutil.dart';

import 'bill_content_chart.dart';
import 'bill_content_list_title.dart';

class BillContent extends StatefulWidget {
  final dynamic item;

  BillContent(this.item);

  @override
  _BillContentState createState() => _BillContentState();
}

class _BillContentState extends State<BillContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            Img.allUrl("ic_home_top_bg.png"),
            height: MediaQuery.of(context).size.height/2,
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                ///  Card 柱状图部分
                child:Container(
                  color: Colors.white,
                  child:  BillContentChart(),
                )
              ),
              SliverToBoxAdapter(
                ///  内容区域图标部分
                child: BillContentListTitle(_listTypeChange),
              ),
              SliverToBoxAdapter(
                ///  内容区域图标部分
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "2020年7月22日 星期三",
                    style: TextStyle(fontSize: 11.0),
                  ),
                ),
              ),
              SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  (c, i) => HomePageItem(
                    title: data[i]["title"],
                    url: data[i]["url"],
                    rightStr: data[i]["rightStr"],
                  ),
                  childCount: data.length,
                ),
                itemExtent: 48.0,
              )
            ],
          )
        ],
      ),
    );
  }

  void _listTypeChange(order_type) {
    setState(() {
      ToastUtil.show("排序类型 切换 -- $order_type");
    });
  }
}

const List data = [
  {"title": "餐饮", "url": "ic_home_item_buycar.png", "rightStr": "¥598.98"},
  {"title": "交通", "url": "ic_home_item_car.png", "rightStr": "¥1,298.98"},
  {"title": "出行", "url": "ic_home_item_food.png", "rightStr": "¥59,998.98"},
  {"title": "骑车", "url": "ic_home_item_buycar.png", "rightStr": "¥1,000.98"},
  {"title": "购物", "url": "ic_home_item_car.png", "rightStr": "¥100,100.98"},
  {"title": "娱乐", "url": "ic_home_item_food.png", "rightStr": "¥2.98"},
  {"title": "文教", "url": "ic_home_item_buycar.png", "rightStr": "¥1.00"},
  {"title": "育儿", "url": "ic_home_item_car.png", "rightStr": "¥4.20"},
  {"title": "通讯", "url": "ic_home_item_buycar.png", "rightStr": "¥900.18"},
  {"title": "住房", "url": "ic_home_item_food.png", "rightStr": "¥598.00"},
  {"title": "零食", "url": "ic_home_item_buycar.png", "rightStr": "¥5.50"},
];
