import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 引导页
class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          Text("一副好看的皮囊可以为你增添\n36%的记账乐趣"),
        ],
      ),
    );
  }
}
