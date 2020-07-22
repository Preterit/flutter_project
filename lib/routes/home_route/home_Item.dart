/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time: 2019/5/7 下午12:22
 */
import 'package:flutter/material.dart';
import 'package:flutterproject/util/imgutil.dart';

/*
 * 列表 条目
 */
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
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 20.0,
                    child: Image.asset(
                      Img.allUrl(widget.url),
                      fit: BoxFit.cover,
                      color: Colors.redAccent,
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),
                  Positioned(
                    left: 70.0,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    child: Text(
                      widget.rightStr,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            indent: 70.0,
            height: 1.0,
            color: Colors.black12,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
