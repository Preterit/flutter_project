/*
* Date:2020/7/23
* author:lwb
* Desc:  柱状图下面 ，列表上面 账单明细
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillContentListTitle extends StatefulWidget {
  final Function listTypeChange;

  BillContentListTitle(this.listTypeChange);

  @override
  _BillContentListTitleState createState() => _BillContentListTitleState();
}

class _BillContentListTitleState extends State<BillContentListTitle> {
  // 列表排序
  var order_type = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "账单明细",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: listTypeChange,
            child: Container(
              padding: EdgeInsets.only(
                  top: 3.0, left: 12.0, right: 12.0, bottom: 3.0),
              child: Text(
                order_type == 1 ? "按时间" : "按金钱",
                style: TextStyle(fontSize: 13.0),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 切换 列表 排列顺序。
  void listTypeChange() {
    setState(() {
      order_type == 1 ? order_type = 2 : order_type = 1;
      widget.listTypeChange(order_type);
    });
  }
}
