/*
* Date:2020/7/23
* author:lwb
* Desc: 报表页面 - 内容区域
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/routes/chart_route/chart_list_data.dart';
import 'package:flutterproject/util/imgutil.dart';
import 'chart_list_item.dart';
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
              SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  (c, i) => ChartListItem(chartListData[i]),
                  childCount: chartListData.length,
                ),
                itemExtent: 70.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
