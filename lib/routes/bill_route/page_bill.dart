import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/routes/bill_route/bill_top.dart';

/*
 * 账单
 */
class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

List getTabList() => [
      '1月',
      '2月',
      '3月',
      '4月',
      '5月',
      '6月',
      '7月',
      '8月',
      '9月',
      '10月',
      '11月',
      '12月',
    ];

class _BillPageState extends State<BillPage>
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
      child: Column(
        children: <Widget>[
          BillTop(mController),
          Expanded(
            child: Container(
              child: Text('sksksksks'),
            ),
          ),
        ],
      ),
    );
  }
}
