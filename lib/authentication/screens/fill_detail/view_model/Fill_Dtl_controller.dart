
import 'package:edgrow_app/authentication/screens/fill_detail/model/ProfileDtlModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';

import '../../../../network/ApiConstant/api_headers.dart';

import '../../upload_cv/view/Upload_cv_resume_screen.dart';
import '../repo/fill_dtl_repo.dart';

class FillDtlController extends GetxController{
  final _apiRepo = FillDtlRepository();
  ProfileDtlModel? profileDtlModel;
  var screenLoader=false.obs;



  getProfileDtlApi(BuildContext context) async{
    screenLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);
    var params=ApiHeaders.profileDtl(
      userId: userId!
    );
    var result = await _apiRepo.getProfileUpdateDtl(params: params);

    if(result!=null){
      screenLoader.value=false;
      if (result is Map<String, dynamic>) {
        profileDtlModel =ProfileDtlModel.fromJson(result);
        SecureStorage.write(key: SecureStorage.contactInfo, value: profileDtlModel!.contactInfo.toString());
        SecureStorage.write(key: SecureStorage.eduDtl, value:  profileDtlModel!.educationDetails.toString());
        SecureStorage.write(key: SecureStorage.keySkill, value:  profileDtlModel!.keySkills.toString());
        SecureStorage.write(key: SecureStorage.jobPref, value:  profileDtlModel!.jobPreferences.toString());
        SecureStorage.write(key: SecureStorage.preferedLoc, value:  profileDtlModel!.preferredLocation.toString());
        SecureStorage.write(key: SecureStorage.expSalary, value:  profileDtlModel!.expectedSalary.toString());
        SecureStorage.write(key: SecureStorage.resume, value:  profileDtlModel!.resume.toString());

        if(profileDtlModel!.contactInfo==1 && profileDtlModel!.educationDetails==1 && profileDtlModel!.keySkills==1
          && profileDtlModel!.jobPreferences==1 && profileDtlModel!.preferredLocation==1 && profileDtlModel!.expectedSalary==1
        && profileDtlModel!.resume==1 ){
          completeAccount(context);
        }
      }else{
        Get.snackbar(
            'Profile Details', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Profile Details', '$result',
          backgroundColor: textfeildborder);
      screenLoader.value=false;
    }
  }
}