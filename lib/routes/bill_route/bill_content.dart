/*
* Date:2020/7/23
* author:lwb
* Desc: 账单页面 - 内容区域
*/
import 'package:flutter/cupertino.dart';

import 'bill_content_chart.dart';

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
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            ///  内容区域图标部分
            child: BillContentChart(),
          ),
          SliverToBoxAdapter(
            ///  内容区域图标部分
            child: BillContentChart(),
          ),
          SliverToBoxAdapter(
            ///  内容区域图标部分
            child: BillContentChart(),
          ),
        ],
      ),
    );
  }
}
