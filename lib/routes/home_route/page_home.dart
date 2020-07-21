import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_top_appbar.dart';

/*
 * 首页
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const List data = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
];

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0.0; // 顶部 固定 标题的 标示
  void onScrollChange(offset) {
    setState(() {
      if (offset != null) {
        appBarAlpha = offset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshConfiguration.copyAncestor(
        context: context,
        maxOverScrollExtent: 100,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  /// 背景层
                  HomeTopBg(),

                  /// 列表数据层
                  HomeCenterWidget(onScrollChange),
                ],
              ),

              /// 滑动顶部 显示 logo
              Opacity(
                opacity: appBarAlpha,
                child: HomeTopBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
