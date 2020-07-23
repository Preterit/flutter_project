import 'package:fluro/fluro.dart';
import 'package:flutterproject/config/route_handlers.dart';

class Routes {
  static String root = "/";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";
  static String testpage = "/textpage";

  static const String guide = "/guide";

  static const String refresh = "/refresh";

  static const String barChart = "/barChart";  // 柱状图

  static void configureRoutes(Router router) {
    router.notFoundHandler = emptyHandler;
    router.define(root, handler: rootHandler);
    router.define(demoSimple, handler: demoRouteHandler);
    router.define(demoSimpleFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(guide, handler: guideHandler); /// 引导页面

    router.define(testpage, handler: scrollViewHandler);
    router.define(refresh, handler: refreshHandler);
    router.define(barChart, handler: barChartHandler);
  }
}
