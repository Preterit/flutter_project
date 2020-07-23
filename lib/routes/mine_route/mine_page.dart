import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/routes/home_route/home_center_record.dart';

import 'mine_advertising.dart';
import 'mine_list_item.dart';
import 'mine_msg_setting.dart';
import 'mine_user.dart';

/*
 * 我
 */
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          ///  设置/消息中心
          child: MsgSetting(),
        ),
        SliverToBoxAdapter(
          ///  登陆信息等
          child: UserInfo(),
        ),
        SliverToBoxAdapter(
          ///  4个广告位
          child: Advertising(),
        ),
        SliverToBoxAdapter(
          /// 灰色分割线
          child: Container(
            height: 10.0,
            color: Color.fromARGB(255, 248, 248, 248),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (c, i) => MineItemBuilder(data[i]),
            childCount: data.length,
          ),
          itemExtent: 48.0,
        )
      ],
    );
  }
}

List data = [
  {
    "icon": "ic_me_theme.webp",
    "title": "港股行情免费分析",
    "desc": "广告",
  },
  {
    "icon": "ic_me_vip.png",
    "title": "开通VIP",
    "desc": "给我钱就行",
  },
  {
    "icon": "ic_me_theme.webp",
    "title": "我的福利",
    "desc": "热门活动",
  },
  {
    "icon": "ic_me_service.png",
    "title": "我的客服",
    "desc": "联系客服",
  },
  {
    "icon": "ic_me_vip.png",
    "title": "邀请好友得VIP",
    "desc": "",
  },
  {
    "icon": "ic_me_tool.webp",
    "title": "实用工具",
    "desc": "房贷计算器",
  },
];
