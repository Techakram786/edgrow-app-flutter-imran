import 'dart:async';

import 'dart:developer';

import 'package:edgrow_app/network/model/api_response.dart';
import 'package:get/get.dart';

import '../../network/api.dart';
import '../../network/ApiConstant/api_response_error_massage.dart';
import '../../network/ApiConstant/api_url.dart';


class BoardingRepository{

  Future<dynamic> getApiBoarding() async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnBoarding);
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
        onApiFailed: (error)  {
              completer.complete(error);
          Get.snackbar('Error', error);
          log(error.toString());
          // completer.complete(error);
        },
      );
    } catch (ex) {
      completer.complete(ex);
      Get.snackbar('Error', ex.toString());
      log(ex.toString());
      // completer.completeError(ex.toString());
    }

    return completer.future;
  }
}