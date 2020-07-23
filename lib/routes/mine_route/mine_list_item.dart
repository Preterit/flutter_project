/*
* Date:2020/7/22
* author:lwb
* Desc: 个人中心
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/util/imgutil.dart';

class MineItemBuilder extends StatefulWidget {
  @override
  _MineItemBuilderState createState() => _MineItemBuilderState();

  var item;

  MineItemBuilder(this.item);
}

class _MineItemBuilderState extends State<MineItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: Image.asset(Img.allUrl(widget.item["icon"])),
                ),
                Expanded(
                  child: Text(
                    widget.item["title"],
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                widget.item["desc"] == ""
                    ? Image.asset(
                        Img.allUrl("ysf_new_message_notify.png"),
                        height: 5.5,
                        width: 5.5,
                      )
                    : Text(
                        widget.item["desc"],
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                Container(
                  margin: EdgeInsets.only(top: 2.0, left: 2.0),
                  child: Image.asset(
                    Img.allUrl("ic_mine_right_back.png"),
                    height: 15.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.5,
            color: Color.fromARGB(255, 230, 230, 230),
          ),
        ],
      ),
    );
  }
}
