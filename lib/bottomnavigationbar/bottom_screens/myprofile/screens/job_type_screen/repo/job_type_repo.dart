import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../../../../network/api.dart';
import '../../../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../../../network/ApiConstant/api_url.dart';
import '../../../../../../network/model/api_response.dart';

class JobTypeRepository{

  Future<dynamic> getJobType(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnGetJobType);
      api.get(
        bearerToken: token,
        onApiSuccess: (response) {
          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(apiResponse.data);
          } else {
            Get.snackbar('Error', apiResponse.message.toString());
            completer.complete(apiResponse.message);
          }
        },
        onApiFailed: (error) {
          completer.complete(error);
          // Get.snackbar('Error', error);
          log('Api error $error');
        },
      );
    } catch (ex) {
      completer.complete(ex);
      // Get.snackbar('Error', ex.toString());
      log('Api exception ${ex.toString()}');
    }
    return completer.future;
  }

  Future<dynamic> updateJobType({required String token,required var params}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnUpdateJobType);
      api.post(
        bearerToken: token,
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