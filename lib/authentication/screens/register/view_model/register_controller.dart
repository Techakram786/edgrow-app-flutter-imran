

import 'package:edgrow_app/authentication/screens/register/model/RegisterModel.dart';
import 'package:edgrow_app/authentication/screens/register/repository/register_repository.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as data;


import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../network/ApiConstant/api_headers.dart';


class RegisterController extends GetxController{
  final _apiRepo = RegisterRepository();
  var buttonLoader=false.obs;

  registerApi({required String name,
                   required String mobileNo,
                   required String email,
                   required String password,
                   required String cPassword,
                   required data.MultipartFile  profilePic})async{
    buttonLoader.value=true;
    var params=ApiHeaders.registerUser(
      name: name,
      mobile: mobileNo,
      email: email,
      password: password,
      cpassword: cPassword,
      img: profilePic
    );

     var result = await _apiRepo.registerUser(params:params);

    if(result!=null){
      buttonLoader.value=false;
      if(result is Map<String, dynamic>){
        RegisterModel user = RegisterModel.fromJson(result);
        print('result  ${user.email}');
        SecureStorage.write(key: SecureStorage.appUserId, value: user.id.toString());
        Get.snackbar(
            'Registration', 'Registered Successfully',
            backgroundColor: textfeildborder);

        Get.offAllNamed(RoutesName.currentPositionScreen);
      }else{
        Get.snackbar(
            'Registration', '$result',
            backgroundColor: textfeildborder);
      }

    }else{
      buttonLoader.value=false;
    }
  }
}