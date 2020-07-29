import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

/*
* Date:2020/7/29
* author:lwb
* Desc: 月账单选择器。
*/
class MonthSelector extends StatefulWidget {
  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              ToastUtil.show("left--click");
            },
            child: Image.asset(
              Img.allUrl("ic_top_left_arrow.png"),
              height: 30.0,
              width: 30.0,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              child: PageView.builder(
                itemBuilder: (context, index) => centerWidget(),
                itemCount: 12,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ToastUtil.show("right--click");
            },
            child: Image.asset(
              Img.allUrl("ic_top_right_arrow.png"),
              height: 30.0,
              width: 30.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget centerWidget() {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      //一行的Widget数量
      crossAxisCount: 6,
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
