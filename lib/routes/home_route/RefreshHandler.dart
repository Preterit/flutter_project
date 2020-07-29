/*
* Date:2020/7/20
* author:lwb
* Desc:
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/popup_window.dart';
import 'package:flutterproject/util/imgutil.dart';

class RefreshHandler extends StatefulWidget {
  @override
  _RefreshHandlerState createState() => _RefreshHandlerState();
}

const double windowHeight = 200;

class _RefreshHandlerState extends State<RefreshHandler>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(
          child: PopupWindowButton(
            child: getButton(),
            window: contentWidget(),
            /// not required.
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
        ),
      ),
    );
  }

  Widget getButton() {
    return Row(
      children: <Widget>[
        Text(
          "2020年",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          Img.allUrl("ic_bill_down.png"),
          color: Colors.black,
        ),
      ],
    );
  }

  Widget contentWidget(){
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 1,
        bottom: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.greenAccent,
            child: Text(
              "账单",
              style: TextStyle(
                fontSize: 19.0,
              ),
            ),
          ),
          Container(
            height: 40,
            color: Colors.transparent,
          ),
          Container(
            height: 160,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
