import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutterproject/net/net_url.dart';

/// "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1"
class DioFactory {
  /// 工厂模式 : 单例公开访问点
  factory DioFactory() => _getInstance();

  static DioFactory get instance => _getInstance();

  /// 静态私有成员，没有初始化
  static DioFactory _instance;

  /// 静态、同步、私有访问点
  static DioFactory _getInstance() {
    if (_instance == null) {
      _instance = new DioFactory._();
    }
    return _instance;
  }

  Dio dio;
  BaseOptions options;

  /// 私有构造函数
  DioFactory._() {
    dio = Dio()
      ..options = BaseOptions(
        baseUrl: NetUrl.BASE_URL,
        connectTimeout: 10000,
        receiveTimeout: 3000,
      )
      //网络状态拦截
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
            // TODO 请求之前
//        print('request:url==>>>${options.path},pamars==>>>>${options.data}');
        return options; //continue
      }, onResponse: (Response response) {
        return response; // continue
      }, onError: (DioError e) {
        return e; //continue
      }));
      //拦截器
//      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}

void _setAdapter() {
  DefaultHttpClientAdapter adapter = DefaultHttpClientAdapter();
  adapter.onHttpClientCreate = (HttpClient client) {
    client.findProxy = (uri) {
      //比如"PROXY 192.168.50.142:8888
      return "PROXY IP:端口";
    };
  };
}
