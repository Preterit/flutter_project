/*
* Date:2020/7/23
* author:lwb
* Desc: 账单页面 - 内容区域
*/
import 'package:flutter/cupertino.dart';
import 'package:flutterproject/common/toast.dart';

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
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            ///  内容区域图标部分
            child: BillContentChart(),
          ),
          SliverToBoxAdapter(
            ///  内容区域图标部分
            child: BillContentListTitle(_listTypeChange),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (c, i) => Text("sjsjsjs"),
              childCount: data.length,
            ),
            itemExtent: 48.0,
          )
        ],
      ),
    );
  }

  void _listTypeChange(order_type){
    setState(() {
      ToastUtil.show("排序类型 切换 -- $order_type");
    });
  }
}
