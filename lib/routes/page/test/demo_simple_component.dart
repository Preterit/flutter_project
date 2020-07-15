import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/util/color_helpers.dart';

/// 测试路由的 页面
class DemoSimpleComponent extends StatefulWidget {
  @override
  _DemoSimpleComponentState createState() => _DemoSimpleComponentState();

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
    return Material(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/acc_boom.png"),
            color: ColorHelpers.blackOrWhiteContrastColor(color),
            width: 260.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorHelpers.blackOrWhiteContrastColor(color),
                height: 2.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 42.0),
              child: FlatButton(
                highlightColor:
                ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(17),
                splashColor:
                ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(34),
                onPressed: () {
                  if (result == null) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context, result);
                  }
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: ColorHelpers.blackOrWhiteContrastColor(color),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
