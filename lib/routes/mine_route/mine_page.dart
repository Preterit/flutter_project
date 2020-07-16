import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * 我
 */
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("我"),
      ),
    );
  }
}
