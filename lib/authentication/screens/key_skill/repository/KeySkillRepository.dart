
import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../../network/api.dart';
import '../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../network/ApiConstant/api_url.dart';
import '../../../../network/model/api_response.dart';

class KeySkillRepository{

  Future<dynamic> getSkill() async {


    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnGetSkill);
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

  Future<dynamic> updateKeySkill({required var params}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnUpdateSkill);
      api.post(

        rawData:params,
        onApiSuccess: (response) {

          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(true);
          } else {
            Get.snackbar('Error', apiResponse.message.toString());
            completer.complete(apiResponse.message);
          }
        },
        onApiFailed: (error) {
          Get.snackbar('Error', error.message.toString());
          log(error.message);
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