/*
* Date:2020/7/23
* author:lwb
* Desc: 账单页面 - 内容区域
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

import 'bill_content_chart.dart';
import 'bill_content_list_title.dart';
import 'bill_item.dart';
import 'bill_model.dart';

class BillContent extends StatefulWidget {
  final dynamic item;

  BillContent(this.item);

  @override
  _BillContentState createState() => _BillContentState();
}

class _BillContentState extends State<BillContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            Img.allUrl("ic_home_top_bg.png"),
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: <Widget>[
              ///  Card 柱状图部分
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: BillContentChart(),
                ),
              ),
              SliverToBoxAdapter(
                ///  内容区域图标部分
                child: BillContentListTitle(_listTypeChange),
              ),
              orderType == 1
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (c, i) {
                          return _getBillItem(i);
                        },
                        childCount: billData.length,
                      ),
                    )
                  : SliverFixedExtentList(
                      delegate: SliverChildBuilderDelegate(
                        (c, i) => BillPriceItem(billData[i]),
                        childCount: billData.length,
                      ),
                      itemExtent: 60.0,
                    )
            ],
          )
        ],
      ),
    );
  }

  /*
   * 账单页面 按照时间排序
   */
  Widget _getBillItem(index) {
    var data = billData[index];
    if (index == 0) {
      data["isShowTitle"] = true;
    } else {
      if (billData[index - 1]["time"] != data["time"]) {
        data["isShowTitle"] = true;
      } else {
        data["isShowTitle"] = false;
      }
    }

    /// 注意 条目 的要有高度
    return BillTimeItem(data);
  }

  int orderType = 1;

  void _listTypeChange(order_type) {
    setState(() {
      orderType = order_type;
      ToastUtil.show("排序类型 切换 -- $order_type");
    });
  }
}
