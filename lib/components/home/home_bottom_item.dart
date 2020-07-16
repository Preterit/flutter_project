import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 底部导航 item
Widget HomeBottomNavBar(_currentIndex, _onTap) {
  return BottomNavigationBar(
    items: createBarItem(_currentIndex),
    currentIndex: _currentIndex,
    unselectedItemColor: _normalColor,
    selectedItemColor: _selectColor,
    type: BottomNavigationBarType.fixed,
    selectedFontSize: 10.0,
    unselectedFontSize: 10.0,
    onTap: _onTap,
  );
}

List<BottomNavigationBarItem> createBarItem(_currentIndex) {
  List<BottomNavigationBarItem> list = new List();

  /// 初始选中item 角标
  int index = 0;
  imageUrlMap.forEach((key, value) {
    var barItem = BottomNavigationBarItem(
      icon: Image(
        width: 25,
        height: 25,
        fit: BoxFit.cover,
        image: AssetImage(
          _currentIndex == index ? imageUrlMap[key][0] : imageUrlMap[key][1],
        ),
      ),
      title: Text(key),
    );
    list.add(barItem);
    index = index + 1;
  });
  return list;
}

var _normalColor = Colors.grey;
var _selectColor = Colors.pinkAccent;

Map<String, List<String>> imageUrlMap = {
  "首页": [
    "assets/images/ic_skin_home_property_pressed.png",
    "assets/images/ic_skin_home_property.png"
  ],
  "账单": [
    "assets/images/ic_skin_home_bill_pressed.png",
    "assets/images/ic_skin_home_bill.png"
  ],
  "报表": [
    "assets/images/ic_skin_home_chart_pressed.png",
    "assets/images/ic_skin_home_chart.png"
  ],
  "赚钱": [
    "assets/images/ic_skin_home_finance_pressed.png",
    "assets/images/ic_skin_home_finance.png"
  ],
  "我": [
    "assets/images/ic_skin_home_me_pressed.png",
    "assets/images/ic_skin_home_me.png"
  ],
};
