import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

import 'hor_procress.dart';

/*
 *  按照金钱来排序
 */
class ChartListItem extends StatelessWidget {

  final dynamic item;

  ChartListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ToastUtil.show("${item["title"]}");
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Center(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      Img.allUrl(
                        item["url"],
                      ),
                      color: Colors.red,
                      height: 25.0,
                      width: 25.0,
                      fit: BoxFit.cover,
                    ),
                    margin: EdgeInsets.only(top: 6.0),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${item["title"]} ${item["proportion"]}",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        HorProcress(item["proportionValue"] * 100),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "${item["rightStr"]}",
                        style: TextStyle(fontSize: 16.0, color: Colors.red),
                      ),
                      Text(
                        "${item["count"]}笔",
                        style: TextStyle(fontSize: 11.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2.0, left: 2.0),
                    child: Image.asset(
                      Img.allUrl("ic_mine_right_back.png"),
                      height: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1.0,indent: 36,color: Color.fromARGB(255, 235, 235, 235),)
          ],
        ),
      ),
    );
  }
}

