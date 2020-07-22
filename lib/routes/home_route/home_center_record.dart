/*
* Date:2020/7/21
* author:lwb
* Desc: 首页中间添加记录布局
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

/*
 * 记账/添加资产
 */
class HomeCenterRecord extends StatefulWidget {
  @override
  _HomeCenterRecordState createState() => _HomeCenterRecordState();
}

class _HomeCenterRecordState extends State<HomeCenterRecord> {
  void _record() {
    ToastUtil.show("记一笔");
  }

  void _addZc() {
    ToastUtil.show("添加资产");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 55.0,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                  blurRadius: 15.0, //阴影模糊程度
                  spreadRadius: 1.0, //阴影扩散程度
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: _record,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            Img.allUrl("ic_home_record_pencil.png"),
                            color: Colors.white,
                            height: 15.0,
                            width: 25.0,
                          ),
                          Text(
                            "记一笔",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: 1.5,
                  height: 35.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white12),
                  ),
                ),
                InkWell(
                  onTap: _addZc,
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      "添加资产",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  " 近三日新增账单 2 笔",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Image.asset(Img.allUrl("ic_home_record_more.png")),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            " 2020年7月17日 星期无",
            style: TextStyle(fontSize: 10.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
