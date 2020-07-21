/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time: 2019/5/7 下午12:22
 */
import 'package:flutter/material.dart';
import 'package:flutterproject/util/imgutil.dart';

class HomePageItem extends StatefulWidget {
  final String title;
  final String url;
  final String rightStr;

  HomePageItem({this.title, this.url, this.rightStr});

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      height: 50.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Img.allUrl(widget.url),
                color: Colors.redAccent,
                height: 35.0,
                width: 40.0,
              ),
              Expanded(
                flex: 1,
                child: Text(widget.title,style: TextStyle(
                  color: Colors.black
                ),),
              ),
              Text(
                widget.rightStr,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 1.0,
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
