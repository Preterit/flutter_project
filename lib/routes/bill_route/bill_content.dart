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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (c, i) {
                    return _getBillItem(i);
                  },
                  childCount: billData.length,
                ),
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

  void _listTypeChange(order_type) {
    setState(() {
      ToastUtil.show("排序类型 切换 -- $order_type");
    });
  }
}

List billData = [
  {
    "title": "餐饮",
    "url": "ic_home_item_buycar.png",
    "rightStr": "¥598.98",
    "time": "2020年07月12日 星期日",
    "isShowTitle": false,
  },
  {
    "title": "交通",
    "url": "ic_home_item_car.png",
    "rightStr": "¥1,298.98",
    "time": "2020年07月12日 星期日",
    "isShowTitle": false,
  },
  {
    "title": "出行",
    "url": "ic_home_item_food.png",
    "rightStr": "¥59,998.98",
    "time": "2020年07月14日 星期二",
    "isShowTitle": false,
  },
  {
    "title": "骑车",
    "url": "ic_home_item_buycar.png",
    "rightStr": "¥1,000.98",
    "time": "2020年07月15日 星期三",
    "isShowTitle": false,
  },
  {
    "title": "购物",
    "url": "ic_home_item_car.png",
    "rightStr": "¥100,100.98",
    "time": "2020年07月15日 星期三",
    "isShowTitle": false,
  },
  {
    "title": "娱乐",
    "url": "ic_home_item_food.png",
    "rightStr": "¥2.98",
    "time": "2020年07月15日 星期三",
    "isShowTitle": false,
  },
  {
    "title": "文教",
    "url": "ic_home_item_buycar.png",
    "rightStr": "¥1.00",
    "time": "2020年07月17日 星期五",
    "isShowTitle": false,
  },
  {
    "title": "育儿",
    "url": "ic_home_item_car.png",
    "rightStr": "¥4.20",
    "time": "2020年07月17日 星期五",
    "isShowTitle": false,
  },
  {
    "title": "通讯",
    "url": "ic_home_item_buycar.png",
    "rightStr": "¥900.18",
    "time": "2020年07月19日 星期日",
    "isShowTitle": false,
  },
  {
    "title": "住房",
    "url": "ic_home_item_food.png",
    "rightStr": "¥598.00",
    "time": "2020年07月27日 星期一",
    "isShowTitle": false,
  },
  {
    "title": "零食",
    "url": "ic_home_item_buycar.png",
    "rightStr": "¥5.50",
    "time": "2020年07月27日 星期一",
    "isShowTitle": false,
  },
];
