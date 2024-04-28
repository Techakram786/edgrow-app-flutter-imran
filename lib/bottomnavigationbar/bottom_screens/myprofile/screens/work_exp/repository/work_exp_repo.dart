import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

import '../../../../../../network/Api.dart';
import '../../../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../../../network/ApiConstant/api_url.dart';
import '../../../../../../network/model/api_response.dart';


class WorkExpDtlRepository{

  Future<dynamic> addWorkExpDtl({required var params,required String token}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnAddWorkExp);
      api.post(
        bearerToken: token,
        queryParameters:params,
        onApiSuccess:(response) {

          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(true);
          } else {
            Get.snackbar('Error', apiResponse.message.toString());
            completer.complete( apiResponse.message);
          }
        },
          onApiFailed: (error) {

            if (error is Error) {
              completer.complete(error);

            }  else {
              // Handle other types of errors
              // Get.snackbar('Error', 'Unknown Error: ${error.toString()}');
              completer.complete(error);
            }

          },

      );
    } catch (ex) {
      completer.complete(ex);
      Get.snackbar('Error', ex.toString());
      log(ex.toString());

    }

    return completer.future;
  }
  Future<dynamic> workExpEditDtl({required var params,required String token}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnEditWorkExp);
      api.post(
        bearerToken: token,
        queryParameters:params,
        onApiSuccess:(response) {

          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(apiResponse.data);
          } else {
            Get.snackbar('Error', apiResponse.message.toString());
            completer.complete( apiResponse.message);
          }
        },
        onApiFailed: (error) {
          completer.complete(error);
          Get.snackbar('Error', error);
          log(error.toString());

        },
      );
    } catch (ex) {
      completer.complete(ex);
      Get.snackbar('Error', ex.toString());
      log(ex.toString());

    }

    return completer.future;
  }

  Future<dynamic> updateWorkExpDtl({required var params,required String token}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnUpdateWorkExp);
      api.post(
        bearerToken: token,
        queryParameters:params,
        onApiSuccess:(response) {

          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(true);
          } else {
            Get.snackbar('Error', apiResponse.message.toString());
            completer.complete( apiResponse.message);
          }
        },
        onApiFailed: (error) {
          completer.complete(error);
          Get.snackbar('Error', error);
          log(error.toString());

        },
      );
    } catch (ex) {
      completer.complete(ex);
      Get.snackbar('Error', ex.toString());
      log(ex.toString());

    }

    return completer.future;
  }
}