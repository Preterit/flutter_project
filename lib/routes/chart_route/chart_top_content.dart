/*
* Date:2020/7/25
* author:lwb
* Desc: 图标页面  饼状图
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/routes/chart_route/top_piechart.dart';
import 'package:flutterproject/util/imgutil.dart';

class ChartTopContent extends StatefulWidget {
  @override
  _ChartTopContentState createState() => _ChartTopContentState();
}

class _ChartTopContentState extends State<ChartTopContent> {
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
              elevation: 5.0, //设置阴影
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _getInk()),

                  ///  饼状图
                  TopPieChart(7)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /*
   * 获取 饼状图 上面的 选择item
   */
  List<Widget> _getInk() {
    return _data
        .map((item) => InkWell(
              onTap: () {
                setState(() {
                  for (int i = 0; i < _data.length; i++) {
                    _data[i]["isCheck"] = false;
                  }
                  item["isCheck"] = true;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 15.0, right: 17.0, top: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      Img.allUrl(
                        item["isCheck"]
                            ? "abc_btn_radio_to_on_mtrl_015.png"
                            : "abc_btn_radio_to_on_mtrl_000.png",
                      ),
                      color:
                          item["isCheck"] ? item["select_color"] : Colors.grey,
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item["title"],
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black),
                          ),
                          Text(
                            item["money"],
                            style: TextStyle(
                                fontSize: 14.0, color: item["select_color"]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
  }
}

/*
 *  饼状图 类型选择 的数据
 */
List _data = [
  {
    "id": 0,
    "select_color": Colors.red,
    "isCheck": true,
    "money": "¥72,759.21",
    "title": "月支出"
  },
  {
    "id": 1,
    "select_color": Colors.green,
    "isCheck": false,
    "money": "¥0.00",
    "title": "月收入"
  },
  {
    "id": 2,
    "select_color": Colors.black,
    "isCheck": false,
    "money": "¥0.00",
    "title": "其他"
  },
];
