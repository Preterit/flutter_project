import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page_widget.dart';

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
      body: new Column(
        children: <Widget>[
          HomeTopWidget(),
        ],
      ),
    );
  }
}
