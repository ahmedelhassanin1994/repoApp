


import 'package:mvvm_project/core/common/network/error_handler.dart';

class Failure{
  int? code; // 200 or 400
  String? message;

 Failure(this.code, this.message);

 Failure.fromJson(Map<String, dynamic> json) {

  message = json['message'];
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['message'] = this.message;
  return data;
 }
 @override
 String toString() => 'CustomException(message: $message)';
}

class DefaultFailure extends Failure{

 DefaultFailure() : super(ResponseCode.UNKNOWN,ResponseMessage.UNKNOWN);
}