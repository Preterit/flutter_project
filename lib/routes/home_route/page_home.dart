import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page_widget.dart';
import 'home_top_appbar.dart';

/*
 * 首页
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const APPBAR_SCROLL_OFFSET = 100;

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            //移除ListView得padding
            removeTop: true, //移除Top
            context: context,
            child: NotificationListener(
              //实现对列表得监听  --  接收 onNotification 得回调，每次滚动得时候都会回调这个函数
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  //1、只监测ListView的滚动（深度设为0），2、监测滚动的时候（ScrollUpdateNotification）
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },

              child: ListView(
                //为了实现渐变
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: HomeTopWidget(),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('哈哈'),
                    ),
                  )
                ],
              ),
            ),
          ),

          /// 滑动顶部显示的 状态栏
          Opacity(
            opacity: appBarAlpha,
            child:  HomeTopBar(),
          ),
        ],
      ),
    );
  }
}
