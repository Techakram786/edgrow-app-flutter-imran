import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../../../../network/api.dart';
import '../../../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../../../network/ApiConstant/api_url.dart';
import '../../../../../../network/model/api_response.dart';

class NotificationRepository{

  Future<dynamic> getNotification(var params,String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnNotification);
      api.post(
        bearerToken: token,
        queryParameters: params,
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
          // log('Api error $error');
        },
      );
    } catch (ex) {
      completer.complete(ex);
      log('Api exception ${ex.toString()}');
    }
    return completer.future;
  }


}