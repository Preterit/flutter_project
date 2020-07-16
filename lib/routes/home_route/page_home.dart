import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * 首页
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100.0),
        margin: EdgeInsets.only(top: 100.0),
        child: Text("首页"),
      ),
    );
  }
}
