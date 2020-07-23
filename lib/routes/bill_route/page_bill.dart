import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/common/toast.dart';
import 'package:flutterproject/util/imgutil.dart';

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
      height: 150.0,
      width: double.infinity,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Img.allUrl("ic_home_top_bg.png"),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Text(
                  "账单",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: _moreClick,
                  child: Image.asset(
                    Img.allUrl("ic_home_record_more.png"),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 更多
void _moreClick() {
  ToastUtil.show("more");
}
