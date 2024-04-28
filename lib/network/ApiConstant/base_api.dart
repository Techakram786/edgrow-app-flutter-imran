import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import './api_url.dart';

class BaseApi {
  static BaseOptions _options() {
    return BaseOptions(
      baseUrl: ApiUrl.baseUrl.toString(),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    );
  }

 static Dio dioClient() {
    Dio dio = Dio(_options());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        request: true,
        maxWidth: 90));
    return dio;
  }
}
