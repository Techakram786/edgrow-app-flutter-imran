import 'dart:io';

import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../model/login_model.dart';
import '../repository/login_repository.dart';

class LoginController extends GetxController {
  final _apiRepo = LoginRepository();
  var buttonLoader = false.obs;
 Future<void> loginApi({
    required String login,
    required String password,
  }) async {
    buttonLoader.value = true;
    final String? notificationKey=await SecureStorage.get(key: SecureStorage.deviceToken);
    var deviceType='';
    if (Platform.isAndroid) {
      deviceType='android';
    }
    if (Platform.isIOS) {
      deviceType='ios';
    }
    var params = ApiHeaders.loginUser(
      login: login,
      password: password,
      pushNotificationKey: notificationKey!,
      deviceType: deviceType,
    );

    var result = await _apiRepo.loginUser(params: params);
    print('result final $result');
    if (result != null) {
      buttonLoader.value = false;
      if (result is Map<String, dynamic>) {
        LoginModel user = LoginModel.fromJson(result);

        SecureStorage.write(
            key: SecureStorage.appUserId, value: user.id.toString());
        SecureStorage.write(
            key: SecureStorage.accessToken, value: user.accessToken.toString());
        SecureStorage.write(
            key: SecureStorage.cuurentPosition,
            value: user.isCurrentPositionUpdated.toString());
        if (user.profileData != null) {
          SecureStorage.write(
              key: SecureStorage.contactInfo,
              value: user.profileData!.contactInfo.toString());
          SecureStorage.write(
              key: SecureStorage.eduDtl,
              value: user.profileData!.educationDetails.toString());
          SecureStorage.write(
              key: SecureStorage.keySkill,
              value: user.profileData!.keySkills.toString());
          SecureStorage.write(
              key: SecureStorage.jobPref,
              value: user.profileData!.jobPreferences.toString());
          SecureStorage.write(
              key: SecureStorage.preferedLoc,
              value: user.profileData!.preferredLocation.toString());
          SecureStorage.write(
              key: SecureStorage.expSalary,
              value: user.profileData!.expectedSalary.toString());
          SecureStorage.write(
              key: SecureStorage.resume,
              value: user.profileData!.resume.toString());
        }
        Get.snackbar('Login', 'Login Successfull',
            backgroundColor: textfeildborder);
        if (user.profileData!.contactInfo.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else if (user.profileData!.contactInfo.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else if (user.profileData!.educationDetails.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else if (user.profileData!.keySkills.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else if (user.profileData!.jobPreferences.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else if (user.profileData!.preferredLocation.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else if (user.profileData!.expectedSalary.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else if (user.profileData!.resume.toString() == '0') {
          Get.offAllNamed(
            RoutesName.chooseFillDtlScreen,
          );
        } else {
          Get.offAllNamed(RoutesName.homeScreen, arguments: {
            'currentindex': 0,
            'isChoiseScreen': true,
            'islog': true
          });
        }
      } else {
        Get.snackbar('Login', '$result', backgroundColor: textfeildborder);
      }
    } else {
      buttonLoader.value = false;
    }
  }
}
