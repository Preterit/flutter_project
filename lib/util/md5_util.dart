import 'dart:collection';
import 'dart:convert';

class Md5Util{

  static String md5Method(String str){
    var content = new Utf8Encoder().convert(str);
  }

}


class DataHelper{

  static SplayTreeMap getBaseMap() {
    var map = new SplayTreeMap<String, dynamic>();
    map["platform"] = "1";
    map["system"] = "android";
    map["channel"] = "official";
    map["time"] = new DateTime.now().millisecondsSinceEpoch.toString();
    return map;
  }

}