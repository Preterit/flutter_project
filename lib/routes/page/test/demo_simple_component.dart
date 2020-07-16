import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 测试路由的 页面
class DemoSimpleComponent extends StatefulWidget {
  @override
  _DemoSimpleComponentState createState() => _DemoSimpleComponentState(
      message: this.message, color: this.color, result: this.result);

  DemoSimpleComponent(
      {String message = "TestIng",
      Color color = const Color(0xFFFFFFFF),
      String result})
      : this.color = color,
        this.message = message,
        this.result = result;

  final String message;
  final Color color;
  final String result;
}

class _DemoSimpleComponentState extends State<DemoSimpleComponent> {
  _DemoSimpleComponentState({this.message, this.color, this.result});

  final String message;
  final Color color;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Padding(
          padding: EdgeInsets.only(top: 40.0, left: 40.0),
          child: new Column(
            children: <Widget>[
              Text("测试穿参页面 --- "),
              SizedBox(height: 100.0),
              Text(
                  "测试穿参页面 \n参数：\nmessage: $message\ncolor: $color\nresult: $result "),
              SizedBox(height: 100.0),
              RaisedButton(
                child: Text("返回"),
                onPressed: () {
                  String result_pop = "$result --- 传参数页面的结果。";
                  Navigator.pop(context,result_pop);
                },
              ),
            ],
          )),
    );
  }
}
