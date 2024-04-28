import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import '../../../../../../network/api.dart';
import '../../../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../../../network/ApiConstant/api_url.dart';
import '../../../../../../network/model/api_response.dart';

class JobDetailRepository {

  Future<dynamic> getJobDtl(var params,String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnJobDtl);
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
          Get.snackbar('Error', error);
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

  Future<dynamic> getJobQuestion(var params,String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnJobQuestion);
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
          Get.snackbar('Error', error);
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

  Future<dynamic> saveAns(var params,String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnSaveAns);
      api.post(
        rawData:params ,
        bearerToken: token,
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

  Future<dynamic> getResume(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnResume);
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
      Get.snackbar('Error', ex.toString());
      log('Api exception ${ex.toString()}');
    }
    return completer.future;
  }

  Future<dynamic> applyJob(var params,String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnApplyjob);
      api.post(
        queryParameters:params ,
        bearerToken: token,
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
          completer.complete(error);
          // Get.snackbar('Error', error);
          log('Api error $error');
        },
      );
    } catch (ex) {
      completer.complete(ex);
      Get.snackbar('Error', ex.toString());
      log('Api exception ${ex.toString()}');
    }
    return completer.future;
  }
}