import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../../network/api.dart';
import '../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../network/ApiConstant/api_url.dart';
import '../../../../network/model/api_response.dart';

class ShortListRepository{


  Future<dynamic> getSavedItems(String token,var params) async {
    Completer<dynamic> completer = Completer<dynamic>();
    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnGetSavedItem);
      api.post(
        queryParameters: params,
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
      // completer.complete(ex);
      Get.snackbar('Error', ex.toString());
      log('Api exception ${ex.toString()}');
    }
    return completer.future;
  }

  Future<dynamic> searchSavedItems(var params,String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnSavedSearch);
      api.post(
        queryParameters:params ,
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
          /* Get.snackbar('Error', error);
          log('Api error $error');*/
        },
      );
    } catch (ex) {
      // completer.complete(ex);
      Get.snackbar('Error', ex.toString());
      log('Api exception ${ex.toString()}');
    }
    return completer.future;
  }
}