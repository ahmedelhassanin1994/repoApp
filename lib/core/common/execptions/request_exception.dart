import 'request_error_type.dart';

class RequestException implements Exception {
  RequestErrorType type;
  String message;
  String stackTrace;
  RequestException(this.type, this.message, this.stackTrace);
}
