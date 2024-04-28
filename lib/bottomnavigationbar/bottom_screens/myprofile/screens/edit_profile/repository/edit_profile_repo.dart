import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../../../../network/api.dart';
import '../../../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../../../network/ApiConstant/api_url.dart';
import '../../../../../../network/model/api_response.dart';





class EditProfileRepository{



  Future<dynamic> updateProfile(String token,var params) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnUpdateProfile);
      api.post(
        bearerToken: token,
            rawData: params,
            onApiSuccess: (response) {

          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(true);
          } else {
            Get.snackbar('Error', apiResponse.message.toString());
            completer.complete( apiResponse.message);
          }
        },
            onApiFailed: (error) {
          Get.snackbar('Error', error);
          log(error.toString());
          completer.complete(error);
        },
      );
    } catch (ex) {
      Get.snackbar('Error', ex.toString());
      log(ex.toString());
      completer.complete(ex);
    }

    return completer.future;
  }
  Future<dynamic> getCurrentPosition() async {


    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnGetCurrentPosition);
      api.get(
        onApiSuccess: (response) {

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
  Future<dynamic> getApiState({required var params}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnState);
      api.post(
        queryParameters: params,

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
          Get.snackbar('Error', error);
          log(error.toString());
          completer.complete(error);
        },
      );
    } catch (ex) {
      Get.snackbar('Error', ex.toString());
      log(ex.toString());
      completer.complete(ex);
    }

    return completer.future;
  }

  Future<dynamic> getApiCity({required var params}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnCity);
      api.post(
        queryParameters:params,
        onApiSuccess: (response) {

          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(apiResponse.data);
          } else {
            Get.snackbar('Error', apiResponse.message.toString());
            completer.complete( apiResponse.message);
          }
        },
        onApiFailed: (error) {
          Get.snackbar('Error', error);
          log(error.toString());
          completer.complete(error);
        },
      );
    } catch (ex) {
      Get.snackbar('Error', ex.toString());
      log(ex.toString());
      completer.complete(ex);
    }

    return completer.future;
  }


}