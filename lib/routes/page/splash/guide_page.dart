import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/application.dart';
import 'package:flutterproject/config/routes.dart';

/// 引导页
class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: new Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 50.0, left: 50.0),
                child: Text(
                  "一副好看的皮囊可以为你增添\n36%的记账乐趣",
                  strutStyle: StrutStyle(forceStrutHeight: true, height: 1.85),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.7,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Text(
              "选择你喜欢的主题皮肤吧",
              style: TextStyle(fontSize: 14.0, color: Colors.black26),
            ),
            SizedBox(height: 10.0),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.yellowAccent,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 200.0,
              height: 45.0,
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  "开启记账",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                onPressed: _startUse,
                shape: StadiumBorder(),
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  /// 开始使用  把选中的主题，传递到第二个页面
  void _startUse() {
    Application.navigateTo(context, Routes.root,replace: true);
  }
}
