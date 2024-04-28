import 'dart:async';
import 'dart:io';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';



import '../Utils/internet_disconnect.dart';
import 'ApiConstant/api_error_code.dart';
import 'ApiConstant/base_api.dart';

class API {
  String url;
  bool cancel;
  API({required this.url, this.cancel = true});
  final Dio _dio = BaseApi.dioClient();
  StreamSubscription<Response>? _requestSubscription;
  final bool _cancel = true;

  void _cancelRequest() {
    _requestSubscription?.cancel();
    _requestSubscription = null;
  }
   dynamic _myData;
  Future<void> post(
  {
    String? bearerToken,
    Map<String, dynamic>? queryParameters,
     Object? rawData,
    required Function(dynamic) onApiSuccess,
    required Function(dynamic) onApiFailed,}

  ) async {

    if (_cancel) {
      _cancelRequest();
    }
    try {

      if (rawData != null) {
        _myData = rawData;
      } else {
        FormData formData = FormData.fromMap(queryParameters!);
        _myData = formData;
      }
      _requestSubscription = _dio.post(url,data: _myData,options: Options(headers: {'Authorization': 'Bearer $bearerToken',})).asStream().listen(
        (response) async {
          final connectivityResult = await Connectivity().checkConnectivity();
          if (connectivityResult == ConnectivityResult.none) {
            /*return onApiFailed(Error(
                    statusCode: 503,
                    message:
                        'No internet connection \n ---> Response Status Message ${response.statusMessage}  \n ---> Response Status Code ${response.statusCode}')
                .toString());*/
          }

          if (connectivityResult == ConnectivityResult.wifi ||
              connectivityResult == ConnectivityResult.mobile) {
            if (response.statusCode == ApiErrorCode.statusOk) {
              return onApiSuccess(response.data);
            } else if (response.statusCode == ApiErrorCode.statusServerError) {

              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusServerError,
                  message: 'Internal Server Error '));
            } else if (response.statusCode == ApiErrorCode.statusBadRequest) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusBadRequest,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusUnauthorized) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusUnauthorized,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusForbidden) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusForbidden,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusNotFound) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusNotFound,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusServerError) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusServerError,
                  message: response.statusMessage));
            }
          }
        },
        onError: (error) {

          if (error is DioException) {

            // Handle Dio errors
            if (error.type == DioException.connectionTimeout ||
                error.type == DioException.receiveTimeout ||
                error.type == DioException.sendTimeout) {
              // Handle timeout error
              return onApiFailed(
                  'Request timeout'
              );
            } else if (error.type == DioExceptionType.badResponse) {

              // Handle HTTP response errors
              final response = error.response!;
              if (response.statusCode == 404) {
                return onApiFailed(
                    'Not Found');
              } else {
                return onApiFailed(
                    response.statusMessage ?? 'Unknown error');
              }
            } else {
              // Handle other Dio errors
              return onApiFailed(error.toString());
            }
          } else if (error is SocketException) {
            // Handle SocketException
            return onApiFailed(
                error.toString()
            );
          } else {
            // Handle other types of errors
            return onApiFailed(error.toString());
          }
        },

        cancelOnError: true,
      );
    } catch (ex) {

      return onApiFailed(Error(message: ex.toString(), statusCode: 001));
    }
  }

  Future<void> get (
      {
        Map<String, dynamic>? queryParameters,
        String? bearerToken,
        required Function(dynamic) onApiSuccess,
        required Function(dynamic) onApiFailed,
      }
      ) async {
    if (_cancel) {
      _cancelRequest();
    }
    try {
      // Check internet connectivity
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none)  {
        return Get.to(() => const InternetDisconnect());
      }
      _requestSubscription =   _dio.get(url,queryParameters:queryParameters,options:  Options(
        headers: {
          'Authorization': 'Bearer $bearerToken',
          // Add other headers if needed
        },
      )).asStream().listen(
            ( response) async {

          if (connectivityResult == ConnectivityResult.wifi ||
              connectivityResult == ConnectivityResult.mobile) {
            if (response.statusCode == ApiErrorCode.statusOk) {
              return onApiSuccess(response.data);
            } else if (response.statusCode == ApiErrorCode.statusServerError) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusServerError,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusBadRequest) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusBadRequest,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusUnauthorized) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusUnauthorized,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusForbidden) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusForbidden,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusNotFound) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusNotFound,
                  message: response.statusMessage));
            } else if (response.statusCode == ApiErrorCode.statusServerError) {
              return onApiFailed(Error(
                  statusCode: ApiErrorCode.statusServerError,
                  message: response.statusMessage));
            }
          }
        },
        onError: (error) {
          if (error is DioException) {

            // Handle Dio errors
            if (error.type == DioException.connectionTimeout ||
                error.type == DioException.receiveTimeout ||
                error.type == DioException.sendTimeout) {
              // Handle timeout error
              return onApiFailed(
                  'Request timeout'
              );
            } else if (error.type == DioExceptionType.badResponse) {

              // Handle HTTP response errors
              final response = error.response!;
              if (response.statusCode == 404) {
                return onApiFailed(
                    'Api Not Found'
                );
              } else {
                return onApiFailed(
                    response.statusMessage ?? 'Unknown error'
                );
              }
            } else {
              // Handle other Dio errors
              return onApiFailed(error.toString());
            }
          } else if (error is SocketException) {
            // Handle SocketException
            return onApiFailed(
                error.toString()
            );
          } else {
            // Handle other types of errors
            return onApiFailed(error.toString());
          }
        },
        cancelOnError: true,
      );
    } catch (ex) {
      return onApiFailed( ex.toString());
    }
  }


}

class Error {
  int statusCode;
  String? message;

  Error({required this.statusCode, required this.message});
}
