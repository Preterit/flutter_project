/*
* Date:2020/7/20
* author:lwb
* Desc:
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshHandler extends StatefulWidget {
  @override
  _RefreshHandlerState createState() => _RefreshHandlerState();
}


class _RefreshHandlerState extends State<RefreshHandler>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      drawerEdgeDragWidth: 0.0,
      appBar: AppBar(
        actions: <Widget>[],
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Container(
        child: Text("sjsjsjsjs")
      ),
    );
  }
}
