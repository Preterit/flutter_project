import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterproject/net/dio_factory.dart';
import 'package:flutterproject/net/model/base_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Method {
  get,
  post,
}

var _dio = DioFactory.instance.dio;

class Net {
  /// post 请求
  post(String url, Map<String, dynamic> params,
      {Function success, Function failure}) {
    _doRequest(url, params, Method.post, success, failure);
  }

  /// get 请求
  get(String url, Map<String, dynamic> params,
      {Function success, Function failure}) {
    _doRequest(url, params, Method.get, success, failure);
  }
}

void _doRequest(String url, Map<String, dynamic> params, Method method,
    Function successCallBack, Function failureCallBack) async {
  Response response;
  try {
    switch (method) {

      /// get 请求
      case Method.get:
        if (params != null && params.isNotEmpty) {
          response = await _dio.get(url, queryParameters: params);
        } else {
          response = await _dio.get(url);
        }
        break;
      case Method.post:

        /// post 请求
        if (params != null && params.isNotEmpty) {
          response = await _dio.post(url, queryParameters: params);
        } else {
          response = await _dio.post(url);
        }
        break;
    }

    Map<String, dynamic> result = json.decode(response.toString());

    /// 打印信息
    print("api: $url \nparams: $params \nresult: $result");

    /// 转化为model
    var model = BaseModel.fromJson(result);
    if (model.code == 200) {
      /// 请求成功
      if (successCallBack != null) {
        successCallBack(model.data);
      } else {
        if (failureCallBack != null) {
          failureCallBack(model.code, model.message);
        }
      }
    }
  } catch (exception) {
    // 不指定错误类型，匹配所有
    print('错误：${exception.toString()}');
    Fluttertoast.showToast(msg: "请求失败，请稍后再试");
    if (failureCallBack != null) {
      failureCallBack(exception.toString());
    }
  }
}
