import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/refresh_configuration.dart';
import 'package:flutterproject/config/routes.dart';
import 'package:flutterproject/routes/page/splash/splash_screen.dart';
import 'package:flutterproject/util/util_sp.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  void initState() {
    super.initState();
    SpUtil.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfigurationConfig(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        /// 配置路由
        onGenerateRoute: Application.router.generator,
        home: SplashScreen(),
      ),
    );
  }
}
