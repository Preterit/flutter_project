import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * Date:2020/7/20
 * author:lwb
 * Desc: 首页顶部渐变状态栏
 */
class HomeTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Image.asset("assets/images/ic_home_top_logo.png"),
        ),
      ),
    );
  }
}
