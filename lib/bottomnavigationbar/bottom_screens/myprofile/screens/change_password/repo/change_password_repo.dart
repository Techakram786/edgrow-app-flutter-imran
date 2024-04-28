import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

import '../../../../../../network/Api.dart';
import '../../../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../../../network/ApiConstant/api_url.dart';
import '../../../../../../network/model/api_response.dart';


class ChangePasswordRepository{

  Future<dynamic> changePassword({required var params,required String token}) async {

    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnChangePassword);
      api.post(
        bearerToken: token,
        queryParameters:params,
        onApiSuccess:(response) {

          final apiResponse = ApiResponse.fromJson(response);
          if (apiResponse.status == ApiResponseErrorMassage.valid) {
            completer.complete(true);
          } else {

            completer.complete( apiResponse.message);
          }
        },
          onApiFailed: (error) {
            completer.complete(error);

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