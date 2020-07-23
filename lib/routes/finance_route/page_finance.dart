import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
 * 赚钱
 */
class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Container(
        child: Text("赚钱"),
      ),
    );
  }
}
