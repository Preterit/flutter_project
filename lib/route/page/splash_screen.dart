import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// 启动页  权限加载。
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Image.network(
        'http://img.zcool.cn/community/01a99d5542ea730000019ae9cf7739.jpg@1280w_1l_2o_100sh.png',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void initState() {
    countDown();
    super.initState();
  }

  /// 延迟4秒
  void countDown() {
    var _duration = Duration(seconds: 4);
    Future.delayed(_duration, _indexPage);
  }

  /// 启动主页面
  void _indexPage() {
    print("timeover --- ");
    Navigator.of(context).pushReplacementNamed('/IndexPage');
  }
}
