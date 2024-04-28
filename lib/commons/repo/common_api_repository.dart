import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../network/api.dart';
import '../../network/ApiConstant/api_response_error_massage.dart';
import '../../network/ApiConstant/api_url.dart';
import '../../network/model/api_response.dart';

class CommonApiRepository{


  Future<dynamic> saveItem(String token, var params) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnSavedItem);
      api.post(
        queryParameters:params,
        bearerToken: token,
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
          // Get.snackbar('Error', error);
          log(error.toString());

        },
      );
    } catch (ex) {
      completer.complete(ex);
      // Get.snackbar('Error', ex.toString());
      log(ex.toString());

    }

    return completer.future;
  }

  Future<dynamic> removeItem( String token,var params) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnRemoveItem);
      api.post(
        queryParameters:params,
        bearerToken: token,
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
          // Get.snackbar('Error', error);
          log(error.toString());

        },
      );
    } catch (ex) {
      completer.complete(ex);
      // Get.snackbar('Error', ex.toString());
      log(ex.toString());

    }

    return completer.future;
  }


  Future<dynamic> cms( String token,var params) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnCms);
      api.post(
        queryParameters:params,
        bearerToken: token,
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
          // Get.snackbar('Error', error);
          log(error.toString());

        },
      );
    } catch (ex) {
      completer.complete(ex);
      // Get.snackbar('Error', ex.toString());
      log(ex.toString());

    }

    return completer.future;
  }


}