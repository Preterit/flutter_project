import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class Application {
  static Router router;
  static const String TAG = "&";
  static const String QUESTION_MARK = "?";

  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool replace = false,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    /// 拼接 路由路径
    /// path = "/demo?message=Hello!&color_hex=#f4424b"
    StringBuffer sb = new StringBuffer(path);
    if (params != null && params.isNotEmpty && path != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
//        var value = params[key];
        if (index == 0) {
          sb..write(QUESTION_MARK);
        } else {
          sb..write(TAG);
        }
        sb..write("$key=$value");
        index++;
      }
    }


    path = sb.toString();
    print("------ $path");
    return router.navigateTo(context, path,
        transition: transition,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }
}
