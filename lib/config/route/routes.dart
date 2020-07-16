import 'package:fluro/fluro.dart';
import 'route_handlers.dart';

class Routes {
  static String root = "/";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";
  static String testpage = "/textpage";

  static void configureRoutes(Router router) {
    router.notFoundHandler = emptyHandler;
    router.define(root, handler: rootHandler);
    router.define(demoSimple, handler: demoRouteHandler);
    router.define(demoSimpleFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
  }
}
