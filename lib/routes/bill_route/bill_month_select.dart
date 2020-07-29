/*
* Date:2020/7/29
* author:lwb
* Desc: 月份选择
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/application.dart';

class BillMonthSelect extends StatefulWidget {
  @override
  _BillMonthSelectState createState() => _BillMonthSelectState();
}

class _BillMonthSelectState extends State<BillMonthSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 200,
              child: PageView.builder(
                itemBuilder: (context, index) => centerWidget(),
                itemCount: 12,
              ),
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    color: Color.fromARGB(200, 243, 243, 243),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  onTap: () {
                    Application.router.pop(context);
                  },
                )),
          ],
        ));
  }

  Widget centerWidget() {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      //一行的Widget数量
      crossAxisCount: 6,
      //子Widget宽高比例
      childAspectRatio: 1.0,
      //子Widget列表
      children: getWidgetList(),
    );
  }

  List<Widget> getWidgetList() {
    List<Widget> result = new List();

    for (int i = 0; i < 12; i++) {
      result.add(
        Container(
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              "${i + 1}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      );
    }

    return result;
  }
}
