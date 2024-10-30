

class ModelResponse{
  bool? success;
  dynamic? data;
  String? message;
  dynamic? code;

  ModelResponse({this.success, this.data, this.message, this.code});

  ModelResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}