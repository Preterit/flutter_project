import 'net.dart';
import 'net_url.dart';

class NetUtil {
  /// 测试列表数据
  static void testData(Map<String ,dynamic> params,{Function success,Function failure}){
    Net().get(NetUrl.TEST_URL, params,success: success, failure: failure);
  }
}
