import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/config/application.dart';
import 'package:flutterproject/util/imgutil.dart';

import 'month_selector.dart';
import 'month_year_cus_item.dart';

/*
* Date:2020/7/29
* author:lwb
* Desc: 月份选择
*/
class BillMonthSelect extends StatefulWidget {
  @override
  _BillMonthSelectState createState() => _BillMonthSelectState();
}

class _BillMonthSelectState extends State<BillMonthSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            MYCusItem(),
            MonthSelector(),
            Container(height: 20.0,color: Colors.greenAccent,),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    color: Color.fromARGB(128, 128, 128, 128),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  onTap: () {
                    Application.router.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
