import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/date_util.dart';
import 'package:flutterproject/util/imgutil.dart';

import 'modth_model.dart';
import 'month_item.dart';

/*
* Date:2020/7/29
* author:lwb
* Desc: 月账单选择器。
*/
class MonthSelector extends StatefulWidget {
  @override
  _MonthSelectorState createState() => _MonthSelectorState();

  final int currentMonth;

  MonthSelector(this.currentMonth);
}

class _MonthSelectorState extends State<MonthSelector> {
  PageController pageController;
  int currentIndex;

  @override
  void initState() {
    if (billTopData["selectMonth"] == 0) {
      billTopData["selectMonth"] =
          int.parse("${DateUtil.YEAR}${DateUtil.getZero(DateUtil.MONTH)}");
    }

    pageController = new PageController(
      initialPage: billMonthList.length - 1,
    );
//    pageController.animateToPage(billMonthList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      height: 110,
      child: Row(
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
              color: Colors.grey,
              height: 110,
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    centerWidget(billMonthList[index]["selectYear"]),
                itemCount: billMonthList.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ToastUtil.show("right--click");
              setState(() {});
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

  Widget centerWidget(year) {
    return GridView.count(
      padding: EdgeInsets.all(1.0),
      //一行的Widget数量
      crossAxisCount: 6,
      mainAxisSpacing: 10.0,
      //子Widget列表
      children: getWidgetList(year),
    );
  }

  List<Widget> getWidgetList(int year) {
    List<Widget> result = new List();
    for (int i = 0; i < 12; i++) {
      result.add(
        MonthItem(DateItemBean(year, i + 1)),
      );
    }
    return result;
  }
}
