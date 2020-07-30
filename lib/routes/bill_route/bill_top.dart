/*
* Date:2020/7/23
* author:lwb
* Desc:  账单页面 头布局
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/config/application.dart';
import 'package:flutterproject/config/routes.dart';
import 'package:flutterproject/popup_window.dart';
import 'package:flutterproject/routes/bill_route/page_bill.dart';
import 'package:flutterproject/util/imgutil.dart';

import 'date_select/bill_month_select.dart';

class BillTop extends StatefulWidget {
  final TabController mController;
  final String tabTitle;

  BillTop(this.mController, this.tabTitle);

  @override
  _BillTopState createState() => _BillTopState();
}

class _BillTopState extends State<BillTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 1, bottom: 10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Img.allUrl("ic_home_top_bg.png"),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Text(
                  widget.tabTitle,
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                ),
              ),

              /// 更多按钮
              widget.tabTitle != "报表"
                  ? Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 10.0),
                      child: InkWell(
                        onTap: () {
                          Application.navigateTo(context, Routes.barChart);
                        },
                        child: Image.asset(
                          Img.allUrl("ic_home_record_more.png"),
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Text("")
            ],
          ),

          /// TabBar 以及 年月 筛选条件
          Container(
            child: Center(
              child: Row(
                children: <Widget>[
                  /// 自定义弹框
                  PopupWindowButton(
                    offset: Offset(0, 300),
                    child: getButton(),
                    window: contentWidget(),
                    builder: (Widget child, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SizeTransition(
                          sizeFactor: animation,
                          child: child,
                        ),
                      );
                    },
                  ),

                  /// Tabbar
                  Expanded(
                    child: Container(
                      height: 40.0,
                      child: TabBar(
                        isScrollable: true,
                        labelColor: Colors.white,
                        controller: widget.mController,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                        unselectedLabelStyle: TextStyle(fontSize: 15.0),
                        labelStyle: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600),
                        tabs: getTabList().map((item) {
                          return Tab(text: item);
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 0.8,
                    height: 20.0,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),

                  /// 筛选
                  InkWell(
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 6.0,right: 10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "筛选",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3.5, left: 5.0),
                            child: Image.asset(
                              Img.allUrl("ic_nill_shaixuan.png"),
                              height: 13.0,
                              width: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*
   * popwindow 的内容 布局
   */
  Widget contentWidget() {
    return BillMonthSelect();
  }

  /*
   *  选择年的 按钮
   */
  Widget getButton() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      height: 60,
      child: Row(
        children: <Widget>[
          Text(
            "2020年",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            Img.allUrl("ic_bill_down.png"),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}