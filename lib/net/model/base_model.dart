class BaseModel {
  int code;
  dynamic data;
  String message;

  BaseModel({this.code, this.data, this.message});

  BaseModel.fromJson(Map<String, dynamic> json) {
    this.code = json['code'];
    this.data = json['data'];
    this.message = json['message'];
  }
}
