/*
* Date:2020/7/20
* author:lwb
* Desc:
*/
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'Item.dart';
import 'home_custom_header.dart';
import 'home_page_widget.dart';
import 'home_top_appbar.dart';

class RefreshHandler extends StatefulWidget {
  @override
  _RefreshHandlerState createState() => _RefreshHandlerState();
}

class _RefreshHandlerState extends State<RefreshHandler> {
  List<String> data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  final RefreshController _refreshController = new RefreshController();
  final ScrollController _scrollController = new ScrollController();
  final Key linkKey = GlobalKey();
  bool dismissAppbar = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      final bool ifdismissAppbar = _scrollController.offset >= 136.0;
      if (dismissAppbar != ifdismissAppbar) {
        if (mounted) setState(() {});
      }
      dismissAppbar = ifdismissAppbar;
    });

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      context: context,
      maxOverScrollExtent: 100,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  child: Image.asset(
                    "assets/images/bg_skin_home_overview.png",
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: SmartRefresher(
                    header: CustomHomeHeader(),
                    controller: _refreshController,
                    onRefresh: () async {
                      await Future.delayed(Duration(milliseconds: 3000));
                      _refreshController.refreshCompleted();
                    },
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        SliverFixedExtentList(
                          delegate: SliverChildBuilderDelegate(
                              (c, i) => Item(title: data[i]),
                              childCount: data.length),
                          itemExtent: 100.0,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            /// 滑动顶部 显示 logo
//            HomeTopBar(),
          ],
        ),
      ),
    );
  }
}
