import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/application.dart';
import 'package:flutterproject/config/routes.dart';

import 'main_page_bottom_item.dart';

/// 主页面
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;

  /// 切换页面
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPageList[_currentIndex],
      bottomNavigationBar:HomeBottomNavBar(_currentIndex,_onTap)
    );
  }
}
