import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/application.dart';
import 'package:flutterproject/config/route/routes.dart';

/// 主页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("主页面"),
            RaisedButton(
              child: Text("跳转带参数"),
              onPressed: () {
                Application.navigateTo(context, Routes.textpage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
