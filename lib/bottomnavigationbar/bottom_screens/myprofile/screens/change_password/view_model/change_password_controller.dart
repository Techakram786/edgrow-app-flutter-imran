

import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../repo/change_password_repo.dart';






class ChangePasswordController extends GetxController{
  final _apiRepo = ChangePasswordRepository();
  var buttonLoader=false.obs;




 Future<void> changePasswordApi({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,

  }) async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.changePassword(
       oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword
    );
    var result = await _apiRepo.changePassword(params: params,token: token!);

    if(result!=null){
      buttonLoader.value=false;
      if (result==true) {
        Get.snackbar(
            'Password', 'Password Changed Successfully',
            backgroundColor: textfeildborder);


      }else{
        Get.snackbar(
            'Password', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Password', '$result',
          backgroundColor: textfeildborder);
      buttonLoader.value=false;
    }
  }


}