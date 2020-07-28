/*
* Date:2020/7/28
* author:lwb
* Desc:  账单 列表
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

/*
 * 账单列表 -- 根据时间排序
 */
class BillTimeItem extends StatelessWidget {
  final dynamic item;

  BillTimeItem(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastUtil.show(item["title"]);
      },
      child: Container(
        color: Colors.white,
        height: !item["isShowTitle"] ? 60.0 : 60.0 + 20.0,
        child: Column(
          children: <Widget>[
            Offstage(
              offstage: !item["isShowTitle"], //这里控制 true 不绘制  false 绘制 布尔值
              child: Container(
                height: 20.0,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 3.0, left: 18),
                child: Text(
                  item["time"],
                  style: TextStyle(fontSize: 9.0, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 20.0,
                      child: Image.asset(
                        Img.allUrl(item["url"]),
                        fit: BoxFit.cover,
                        color: Colors.redAccent,
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                    Positioned(
                      left: 70.0,
                      child: Text(
                        item["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                    ),
                    Positioned(
                      right: 20.0,
                      child: Text(
                        item["rightStr"],
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
      ),
    );
  }
}

/*
 * 账单列表 -- 根据金钱排序
 */
class BillPriceItem extends StatelessWidget {
  final dynamic item;

  BillPriceItem(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastUtil.show(item["title"]);
      },
      child: Container(
        color: Colors.white,
        height: 60.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 20.0,
                      child: Image.asset(
                        Img.allUrl(item["url"]),
                        fit: BoxFit.cover,
                        color: Colors.redAccent,
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                    Positioned(
                        left: 70.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item["title"],
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              item["timeFm"],
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10.0),
                            ),
                          ],
                        )),
                    Positioned(
                      right: 20.0,
                      child: Text(
                        item["rightStr"],
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
      ),
    );
  }
}
