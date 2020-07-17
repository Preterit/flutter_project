import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/toast.dart';

const String _noAmountMoneyHide = "* * * * * *";
const String _noInComeMoneyHide = "* * *";
const String _noAmountMoneyShow = "暂无支出";
const String _noInComeMoneyShow = "暂无收入";

/// 文本描述颜色-灰色
const Color _textGreyColor = Colors.grey;

/// 文本描述颜色-白色
const Color _textWhiteColor = Colors.white;

Widget getTopBg() {
  /// 顶部背景图
  return Container(
    width: double.infinity,
    height: 200.0,
    child: Image.asset(
      "assets/images/bg_skin_home_overview.png",
      fit: BoxFit.fill,
    ),
  );
}

class HomeTopWidget extends StatefulWidget {
  @override
  _HomeTopWidgetState createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget> {
  bool _isShow = true;

  /// 支出钱的金额
  String expenditureStr = "";

  /// 收入钱的金额
  String incomeStr = "";

  /// 预算剩余
  String budgetStr;

  /// 支出的金额
  double expenditureStrAmount = 0.00;

  /// 超支的金额
  double budgetMoney = 0.00;

  /// 收入的金额
  double inComeMoney = 0.00;

  /// 查看明细的按钮
  void _onEyeClick() {
    setState(_reFreshStatus);
  }

  @override
  void initState() {
    setState(_reFreshStatus);
    super.initState();
  }

  /// 刷新状态
  void _reFreshStatus() {
    _isShow = !_isShow;
    if (!_isShow) {
      expenditureStr = _noAmountMoneyHide;
      incomeStr = _noInComeMoneyHide;
      budgetMoney == 0 ? budgetStr == null : budgetStr = _noInComeMoneyHide;
    } else {
//        expenditureStrAmount = 99.9;
//        inComeMoney = 8982.98;
//        budgetMoney = 63726.53;

      expenditureStrAmount > 0
          ? expenditureStr = "¥$expenditureStrAmount"
          : expenditureStr = _noAmountMoneyShow;

      inComeMoney == 0
          ? incomeStr = _noInComeMoneyShow
          : incomeStr = "¥$inComeMoney";

      budgetMoney == 0 ? budgetStr = null : budgetStr = "¥$budgetMoney";
    }
  }

  /// 点击 超支
  void _budgetClick() {
    ToastUtil.show("超支");
  }

  /// 点击 收入
  void _inComeClick() {
    ToastUtil.show("收入");
  }

  /// 点击 支出
  void _expenditureClick() {
    ToastUtil.show("支出");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// 背景图
        getTopBg(),
        Padding(
          padding:
              EdgeInsets.only(top: 70.0, left: 15.0, right: 20.0, bottom: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  "本月支出  (元)",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 13.0, color: _textGreyColor),
                ),
              ),

              SizedBox(height: 5.0),

              /// 支出金额 / 显示 按钮
              Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                    onTap: _expenditureClick,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50.0,
                      child: Text(
                        expenditureStr,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: expenditureStr == _noAmountMoneyShow
                              ? _textGreyColor
                              : _textWhiteColor,
                        ),
                      ),
                    ),
                  )),
                  InkWell(
                    onTap: _onEyeClick,
                    child: Image.asset(
                      _isShow
                          ? "assets/images/ic_eye_on.png"
                          : "assets/images/ic_eye_off.png",
                      width: 22.0,
                      height: 22.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),

              /// 收支 数据
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: _inComeClick,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "本月收入",
                            style: TextStyle(
                                fontSize: 13.0, color: _textGreyColor),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            incomeStr,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: incomeStr == _noInComeMoneyShow
                                    ? _textGreyColor
                                    : _textWhiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: _budgetClick,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "预算超支",
                            style: TextStyle(
                                fontSize: 13.0, color: _textGreyColor),
                          ),
                          SizedBox(width: 10.0),
                          budgetStr == null
                              ? Image.asset(
                                  "assets/images/ic_home_setting.png",
                                  height: 18.0,
                                  width: 18.0,
                                )
                              : Text(
                                  budgetStr,
                                  style: TextStyle(
                                      fontSize: 13.0, color: _textWhiteColor),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
