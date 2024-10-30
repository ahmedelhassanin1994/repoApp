import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "Content-Type";
const String CONTENTTYPE = "contentType";

const String ACCEPT = "Accept";
const String DFAULT_LANGOUAGE = "Accept-Language";
// const String AUTHORIZATION = "Authorization";
const String LANGUAGE = "Accept-Language";

class DioFactory {

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration _timeout = Duration(milliseconds: 60 * 1000);
    //  bool login = await _appPreferences.isUserLoggedIn();
    // String token = await _appPreferences.getToken();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      CONTENTTYPE:APPLICATION_JSON,
      // AUTHORIZATION:"$token",
      // LANGUAGE:language
    };


    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      headers:  headers ,
    );
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError e, handler) {
        if (e.type == DioErrorType.badResponse) {
          String errorMessage = e.response?.data.toString() ?? 'Unknown error';
          handler.next(DioError(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: errorMessage,
          ));
        } else {
          handler.next(e); // Continue with other errors
        }
      },
    ));

    if (kReleaseMode) {
    } else {
      dio.interceptors.add((PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      )));
    }
    return dio;
  }
}
