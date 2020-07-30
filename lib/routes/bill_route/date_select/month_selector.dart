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
  var height;

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
    height = ((MediaQuery.of(context).size.width - 80) / 6) * 2;
    return Container(
      color: Colors.white,
      height: height,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              pageController.previousPage(duration: duration, curve: curve);
            },
            child: Container(
              height: double.infinity,
              color: Colors.greenAccent,
              width: 40.0,
              child: Image.asset(
                Img.allUrl("ic_top_left_arrow.png"),
                height: 20.0,
                width: 20.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: height,
              color: Colors.greenAccent,
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
                print(MediaQuery.of(context).size.width);
                pageController.nextPage(duration: duration, curve: curve);
              });
            },
            child: Container(
              color: Colors.greenAccent,
              width: 40.0,
              height: double.infinity,
              child: Image.asset(
                Img.allUrl("ic_top_right_arrow.png"),
                height: 20.0,
                width: 20.0,
              ),
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
