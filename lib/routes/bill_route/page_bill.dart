import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * 账单
 */
class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("账单"),
      ),
    );
  }
}
