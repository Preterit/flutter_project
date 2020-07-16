import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/routes.dart';
import 'package:flutterproject/routes/page/splash/splash_screen.dart';

import '../../config/application.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /// 配置路由
      onGenerateRoute: Application.router.generator,
      home: SplashScreen(),
    );
    return app;
  }
}