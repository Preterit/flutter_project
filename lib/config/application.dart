import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class Application {
  static Router router;

  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool replace = false,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    if (params != null && params.isNotEmpty) {
      for (int i = 0; i < params.keys.length; i++) {
          //TODO   拼接 路径
      }
    }

    return router.navigateTo(context, path,
        transition: transition,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }
}
