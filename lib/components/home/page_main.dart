import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        child: mainPageList[_currentIndex],
        color: Colors.white,
      ),
      bottomNavigationBar:HomeBottomNavBar(_currentIndex,_onTap)
    );
  }
}
