import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/routes/bill_route/bill_content.dart';
import 'package:flutterproject/routes/bill_route/bill_top.dart';
import 'package:flutterproject/routes/bill_route/page_bill.dart';

import 'chart_content.dart';

/*
 * 报表
 */
class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage>
    with SingleTickerProviderStateMixin {
  TabController mController;

  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: getTabList().length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          /// TabBar 部分
          BillTop(mController,"报表"),

          /// 柱状图 / 列表  部分
          Expanded(
            child: TabBarView(
              controller: mController,
              children: getTabList().map((item) => ChartContent(item)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
