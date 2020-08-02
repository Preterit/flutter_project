import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';

const lineColor = Color.fromARGB(255, 82, 87, 101);
const double height = 40.0;
const double borderLineWidth = 1.0;
const radius = Radius.circular(5.0);
const List<String> str = ["月账单", "年账单", "自定义"];
const leftBorderRadius = BorderRadius.horizontal(left: radius);
const rightBorderRadius = BorderRadius.horizontal(right: radius);

/*
* Date:2020/7/29
* author:lwb
* Desc:
*/
class MYCusItem extends StatefulWidget {
  @override
  _MYCusItemState createState() => _MYCusItemState();
}

class _MYCusItemState extends State<MYCusItem> {
  int currentItem = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: height,
        margin:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
        child: Row(
          children: getItems(),
        ),
      ),
    );
  }

  /*
   * 获取 月账单 / 年账单 / 自定义 item 布局
   */
  List<Widget> getItems() {
    List<Widget> result = new List();
    for (int i = 0; i < str.length; i++) {
      result.add(
        Expanded(
          flex: 1,
          child: InkWell(
            child: Container(
              alignment: Alignment.center,
              height: height,
              decoration: BoxDecoration(
                borderRadius: getBorderRadius(i),
                border: getBorder(i),
                color: currentItem == i ? lineColor : Colors.white,
              ),
              child: Text(
                str[i],
                style: TextStyle(
                    color: currentItem == i ? Colors.white : lineColor),
              ),
            ),
            onTap: () {
              ToastUtil.show("${str[i]}");
              setState(() {
                currentItem = i;
              });
            },
          ),
        ),
      );
    }
    return result;
  }

  BorderRadius getBorderRadius(index) {
    BorderRadius result;
    switch (index) {
      case 0:
        result = leftBorderRadius;
        break;
      case 2:
        result = rightBorderRadius;
        break;
    }
    return result;
  }

  Border getBorder(index) {
    Border result;
    switch (index) {
      case 0:
      case 2:
        result = Border.all(
          color: lineColor,
          width: borderLineWidth,
        );
        break;
      case 1:
        result = Border.symmetric(
          horizontal: BorderSide.none,
          vertical: BorderSide(
            color: lineColor,
            width: borderLineWidth,
          ),
        );
        break;
    }
    return result;
  }
}
