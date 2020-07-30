/*
* Date:2020/7/30
* author:lwb
* Desc: endDrawer
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'end_drawer_header.dart';

class EndDrawer extends StatefulWidget {
  @override
  _EndDrawerState createState() => _EndDrawerState();
}

const greyColor = Color.fromARGB(255, 249, 249, 249);
const gery2Color = Color.fromARGB(255, 240, 240, 240);
const greyTxColor = Color.fromARGB(255, 188, 189, 193);

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeaderWidget(),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        "支出",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15.0, color: Colors.red),
                      ),
                      SizedBox(height: 10.0),
                      GridView.count(
                        padding: EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        //一行的Widget数量
                        crossAxisCount: 4,
                        childAspectRatio: 2,
                        mainAxisSpacing: 5.0,
                        //子Widget列表
                        children: getWidgetList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  elevation: 0.0,
                  child: Text("重置"),
                  textColor: greyTxColor,
                  color: greyColor,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  elevation: 0.0,
                  child: Text("完成"),
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getWidgetList() {
    List<Widget> result = new List();
    for (int i = 0; i < items.length; i++) {
      var item = items[i];
      result.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: gery2Color,
          ),
          margin: EdgeInsets.all(2.0),
          alignment: Alignment.center,
          height: 40.0,
          child: Text(
            item,
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      );
    }
    return result;
  }
}

const items = [
  "餐饮",
  "零食烟酒",
  "购物",
  "住房",
  "交通",
  "娱乐",
  "文教",
  "汽车",
  "通讯",
  "育儿",
  "人情",
  "医疗",
  "旅行",
  "投资亏损",
  "利息支出",
  "其他",
  "退款",
];
