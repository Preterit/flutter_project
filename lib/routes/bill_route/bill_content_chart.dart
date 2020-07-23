/*
* Date:2020/7/23
* author:lwb
* Desc: 账单内容区域 - 柱状图
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/util/imgutil.dart';

import 'bill_barchart.dart';

class BillContentChart extends StatefulWidget {
  @override
  _BillContentChartState createState() => _BillContentChartState();
}

class _BillContentChartState extends State<BillContentChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 40.0,
            child: Image.asset(
              Img.allUrl("ic_home_top_bg.png"),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              elevation: 15.0, //设置阴影
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: _getInk(data[0], 0),
                      ),
                      InkWell(
                        child: _getInk(data[1], 1),
                      ),
                    ],
                  ),
                  BillBarChart(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // 点击刷新状态
  Function _onLabClick(index) {
    return () {
      setState(() {
        for (int i = 0; i < data.length; i++) {
          var item = data[i];
          if (index == i) {
            item["isCheck"] = true;
          }else{
            item["isCheck"] = false;
          }
        }
      });
    };
  }

  Widget _getInk(item, index) {
    return InkWell(
      onTap: _onLabClick(index),
      child: Container(
        margin: EdgeInsets.only(left: 15.0, right: 5.0, top: 15.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              Img.allUrl(
                item["isCheck"]
                    ? "abc_btn_radio_to_on_mtrl_015.png"
                    : "abc_btn_radio_to_on_mtrl_000.png",
              ),
              color: item["isCheck"] ? item["color"] : Colors.grey,
              height: 20.0,
            ),
            Text(
              "月支出",
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            Text(
              item["money"],
              style: TextStyle(
                fontSize: 14.0,
                color: index == 0 ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List data = [
  {
    "color": Colors.red,
    "isCheck": true,
    "money": "¥72,759.21",
  },
  {
    "color": Colors.green,
    "isCheck": false,
    "money": "¥0.00",
  }
];
