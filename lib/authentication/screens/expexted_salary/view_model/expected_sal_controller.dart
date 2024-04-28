import 'package:edgrow_app/authentication/screens/expexted_salary/repository/expected_sal_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../../upload_cv/view/Upload_cv_resume_screen.dart';

class ExpectedSalController extends GetxController{
  final _apiRepo = ExpectedSalRepository();

  var buttonLoader=false.obs;

  setUpdateSalaryapi({
    required String startSalary,
    required String endSalary,
    required BuildContext context
  }) async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);
    var params=ApiHeaders.setExpSal(
      userId: userId!,
      startSalary: startSalary,
      endSalary: endSalary

    );
    var result = await _apiRepo.updateExpectedSal(params: params);

    if(result!=null){
      buttonLoader.value=false;
      if (result==true) {
        Get.snackbar('Expected Salary', 'Expected Salary Updated Successfully');
        if(SecureStorage.get(key: SecureStorage.contactInfo)==1 && SecureStorage.get(key: SecureStorage.eduDtl)==1 && SecureStorage.get(key: SecureStorage.keySkill)==1
            && SecureStorage.get(key: SecureStorage.jobPref)==1 && SecureStorage.get(key: SecureStorage.preferedLoc)==1 && SecureStorage.get(key: SecureStorage.expSalary)==1
            && SecureStorage.get(key: SecureStorage.resume)==1 ){
          completeAccount(context);
        }else{
          Get.offAllNamed(RoutesName.chooseFillDtlScreen);
        }
      }else{
        print('no data found ');
      }
    }else{
      buttonLoader.value=false;
    }
  }
}