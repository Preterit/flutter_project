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

const duration = Duration(milliseconds: 100);
const curve = Curves.easeInOut;

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
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              pageController.previousPage(duration: duration, curve: curve);
            },
            child: Image.asset(
              Img.allUrl("ic_top_left_arrow.png"),
              height: 40.0,
              width: 40.0,
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    centerWidget(billMonthList[index]["selectYear"]),
                itemCount: billMonthList.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    print("$index");
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                pageController.nextPage(duration: duration, curve: curve);
              });
            },
            child: Image.asset(
              Img.allUrl("ic_top_right_arrow.png"),
              height: 40.0,
              width: 40.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget centerWidget(year) {
    return GridView.count(
      padding: EdgeInsets.all(0.0),
      //一行的Widget数量
      crossAxisCount: 6,
      childAspectRatio: 0.93,
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
