import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Container(
          child: new Center(
            child: Text("页面丢失"),
          ),
        ),
      ),
    );
  }
}
