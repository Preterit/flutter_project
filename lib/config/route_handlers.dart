import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/routes/bill_route/bar_chart_sample1.dart';
import 'package:flutterproject/routes/home_route/RefreshHandler.dart';
import 'package:flutterproject/routes/page/splash/guide_page.dart';
import 'package:flutterproject/routes/page/test/demo_simple_component.dart';
import 'package:flutterproject/components/empty/empty_page.dart';
import 'package:flutterproject/components/home/page_main.dart';
import 'package:flutterproject/routes/page/test/scrollView_handler.dart';
import 'package:flutterproject/util/color_helpers.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainPage();
});

/// 空白页面
var emptyHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return EmptyPage();
});
/// 测试 fluro 路由框架
var demoRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params["message"]?.first;
  String colorHex = params["color_hex"]?.first;
  String result = params["result"]?.first;
  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = Color(ColorHelpers.fromHexString(colorHex));
  }
  return DemoSimpleComponent(message: message, color: Colors.black54, result: result);
});

/// 引导页面
var guideHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return GuidePage();
});

/// 滑动渐变
var scrollViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ScrollViewHandler();
});

/// 滑动渐变
var refreshHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RefreshHandler();
});

/// 滑动渐变
var barChartHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BarChartSample1();
});
