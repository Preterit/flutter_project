import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/routes/home_route/page_home.dart';
import 'package:flutterproject/util/imgutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_Item.dart';
import 'home_center_record.dart';
import 'home_custom_header.dart';
import 'home_page_widget.dart';

/*
 * Date:2020/7/20
 * author:lwb
 * Desc: 首页 widget
 */

/// 蓝色背景
Widget getBg() {
  return Image.asset(
    "assets/images/ic_home_top_bg.png",
    fit: BoxFit.cover,
  );
}

/// 固定在顶部的  logo
class HomeTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        getBg(),
        Container(
          height: 100.0,
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Image.asset(
              Img.allUrl("ic_vip_yq_sliver.png"),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

/// 首页顶部的背景
class HomeTopBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 400.0,
        child: getBg(),
      ),
    );
  }
}

/*
 * 首页列表，列表头部。
 */
class HomeCenterWidget extends StatefulWidget {
  final Function scrollCallback;

  HomeCenterWidget(this.scrollCallback);

  @override
  _HomeCenterWidgetState createState() => _HomeCenterWidgetState();
}

class _HomeCenterWidgetState extends State<HomeCenterWidget> {
  final RefreshController _refreshController = new RefreshController();
  final ScrollController _scrollController = new ScrollController();
  final double APPBAR_SCROLL_OFFSET = 170; // 总的偏移量

  @override
  void initState() {
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      double alpha = offset / APPBAR_SCROLL_OFFSET;
      if (alpha < 0) {
        alpha = 0;
      } else if (alpha > 1) {
        alpha = 1;
      }
      setState(() {
        // 当正在执行刷新的时候，列表往上滑动，会影响偏移量。
        if (!_refreshController.isRefresh) {
          widget.scrollCallback(alpha);
        }
      });
    });
    super.initState();
  }

  // 释放 资源
  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      /// 适配刘海屏
      top: MediaQuery.of(context).padding.top,
      bottom: MediaQuery.of(context).padding.bottom,
      left: 0.0,
      right: 0.0,
      // 下拉刷新/上啦加载组件
      child: SmartRefresher(
        header: CustomHomeHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(
              /// 头布局
              child: HomeTopWidget(),
            ),
            SliverToBoxAdapter(
              child: Container(
                ///  列表与top布局的 添加资产记录等布局
                child: HomeCenterRecord(),
                color: Colors.white,
              ),
            ),
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (c, i) => HomePageItem(
                  title: data[i]["title"],
                  url: data[i]["url"],
                  rightStr: data[i]["rightStr"],
                ),
                childCount: data.length,
              ),
              itemExtent: 60.0,
            )
          ],
        ),
      ),
    );
  }

  // 刷新
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 3000));
    _refreshController.refreshCompleted();
  }
}
