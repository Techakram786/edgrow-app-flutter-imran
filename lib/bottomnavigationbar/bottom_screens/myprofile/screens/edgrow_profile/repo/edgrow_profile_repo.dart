import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../../../../network/api.dart';
import '../../../../../../network/ApiConstant/api_response_error_massage.dart';
import '../../../../../../network/ApiConstant/api_url.dart';
import '../../../../../../network/model/api_response.dart';

class EdgrowProfileRepository{

  Future<dynamic> getEdgrowProfile(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnEdgrowProfile);
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

  Future<dynamic> getWorkExp(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnWorkExp);
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

  Future<dynamic> getEduDtl(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnEduDtl);
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
  Future<dynamic> getSkill(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnSkillDtl);
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

  Future<dynamic> getLanguage(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnLangDtl);
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

  Future<dynamic> getHobbies(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnhobbiesDtl);
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

  Future<dynamic> getJobDtl(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnJobTypeDtl);
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

  Future<dynamic> updateProfilePic(String token,var params) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnUpdateProfilePic);
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
  Future<dynamic> deleteWorkExpDtl(String token,var params) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnDltWorkExp);
      api.post(
        bearerToken: token,
        queryParameters: params,
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
  Future<dynamic> deleteEduDtl(String token,var params) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnDeleteEduDtl);
      api.post(
        bearerToken: token,
        queryParameters: params,
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
  Future<dynamic> getProfileBanner(String token) async {
    Completer<dynamic> completer = Completer<dynamic>();

    try {
      API api = API(url: ApiUrl.baseUrl + ApiUrl.endpointOnProfileBanners);
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
}