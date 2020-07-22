/*
* Date:2020/7/22
* author:lwb
* Desc: 用户登陆相关 。
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _userClick,
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Image.asset(
                Img.allUrl("ic_vip_default_avatar.png"),
                height: 65.0,
                width: 65.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              height: 58.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "立即登陆",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "登陆后，将会拥有更好的使用体验",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 点击用户
void _userClick() {
  ToastUtil.show("user");
}
