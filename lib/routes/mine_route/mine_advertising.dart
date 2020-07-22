/*
* Date:2020/7/22
* author:lwb
* Desc: 广告/主题 。。。等
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/util/imgutil.dart';

class Advertising extends StatefulWidget {
  @override
  _AdvertisingState createState() => _AdvertisingState();
}

class _AdvertisingState extends State<Advertising> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 28.0, bottom: 20.0),
      color: Colors.white,
      child: Row(children: adBuilder()),
    );
  }
}

// 广告位 创建
List<Widget> adBuilder() {
  List<Widget> result = new List();
  adInfoMap.forEach((item) {
    result.add(Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Img.allUrl(item["imgUrl"]),
            fit: BoxFit.cover,
            height: 35.0,
            width: 35.0,
          ),
          SizedBox(height: 8.0),
          Text(
            item["title"],
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            item["desc"],
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ));
  });
  return result;
}

List adInfoMap = [
  {
    "imgUrl": "ic_vip_theme_l.png",
    "title": "主题换肤",
    "desc": "精选主题",
  },
  {
    "imgUrl": "ic_add_fund_email_netease.png",
    "title": "网易来钱",
    "desc": "高额低息",
  },
  {
    "imgUrl": "ic_qiyu_left_avatar.png",
    "title": "联系我们",
    "desc": "联系我",
  },
  {
    "imgUrl": "ic_me_yd_tab_ad.png",
    "title": "广告投放",
    "desc": "广告",
  },
];
