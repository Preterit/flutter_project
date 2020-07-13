import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class Md5Util{

  /// MD5 加密
  static String str2md5(String str){
    var content = new Utf8Encoder().convert(str);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
