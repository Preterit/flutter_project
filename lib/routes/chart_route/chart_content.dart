/*
* Date:2020/7/23
* author:lwb
* Desc: 报表页面 - 内容区域
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/routes/bill_route/bill_content_list_title.dart';
import 'package:flutterproject/routes/chart_route/chart_list_data.dart';
import 'package:flutterproject/routes/home_route/home_Item.dart';
import 'package:flutterproject/util/imgutil.dart';
import 'chart_top_content.dart';

class ChartContent extends StatefulWidget {
  final dynamic item;

  ChartContent(this.item);

  @override
  _ChartContentState createState() => _ChartContentState();
}

class _ChartContentState extends State<ChartContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            Img.allUrl("ic_home_top_bg.png"),
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: <Widget>[
              ///  Card 饼状图部分
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: ChartTopContent(),
                ),
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
                    title: chartListData[i]["title"],
                    url: chartListData[i]["url"],
                    rightStr: chartListData[i]["rightStr"],
                  ),
                  childCount: chartListData.length,
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
