/*
* Date:2020/7/22
* author:lwb
* Desc:  我的页面 消息通知/ 设置布局
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

class MsgSetting extends StatefulWidget {
  @override
  _MsgSettingState createState() => _MsgSettingState();
}

class _MsgSettingState extends State<MsgSetting> {
  bool hasMsg = true; // 是否有未读消息

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.only(right: 0.0,top: 10.0,bottom: 10.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: _msgClick,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset(
                    Img.allUrl("ic_mine_message.png"),
                    height: 20.0,
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Image.asset(
                    Img.allUrl("ysf_new_message_notify.png"),
                    height: hasMsg ? 5.0 : 0.0,
                    width: hasMsg ? 5.0 : 0.0,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: _settingClick,
            child: Image.asset(
              Img.allUrl("ic_mine_setting.png"),
              height: 21.5,
              width: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}

// 消息
void _msgClick() {
  ToastUtil.show("消息");
}

// 设置
void _settingClick() {
  ToastUtil.show("设置");
}
