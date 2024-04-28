import 'package:edgrow_app/authentication/screens/job_pref/model/JobPrefModel.dart';
import 'package:edgrow_app/authentication/screens/job_pref/repository/Job_pref_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../../upload_cv/view/Upload_cv_resume_screen.dart';

class JobPrefController extends GetxController{

  final _apiRepo = JobPrefRespository();
  var jobPrefData = <JobPrefModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  final RxBool isSearch = false.obs;
  RxList<JobPrefModel> filteredSkills = RxList<JobPrefModel>();
  RxList<int> selectedIndex = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    getJobPrefApi();
  }

  getJobPrefApi()async{
    screenLoader.value=true;
    jobPrefData.clear();
    var result = await _apiRepo.getJobPref();
    print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        jobPrefData.value=result.map((data) => JobPrefModel.fromJson(data)).toList();
        selectedIndex.value = List.filled(jobPrefData.length, 0).obs;
      }else{
        print('no data found $result');
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Job Preferences', '$result',
          backgroundColor: textfeildborder);
    }
  }

  updatejobPrefApi({
    required List<String> jobPref,
    required BuildContext context
  })async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);

    var params=ApiHeaders.updateJobPref(appId: userId!, jobPref:jobPref);
    var result = await _apiRepo.updateJobPref(params: params);
    print('result final $result');
    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Job Preferences', 'Key Skills Updated Successfully',
            backgroundColor: textfeildborder);
        if(SecureStorage.get(key: SecureStorage.contactInfo)==1 && SecureStorage.get(key: SecureStorage.eduDtl)==1 && SecureStorage.get(key: SecureStorage.keySkill)==1
            && SecureStorage.get(key: SecureStorage.jobPref)==1 && SecureStorage.get(key: SecureStorage.preferedLoc)==1 && SecureStorage.get(key: SecureStorage.expSalary)==1
            && SecureStorage.get(key: SecureStorage.resume)==1 ){
          completeAccount(context);
        }else{
          Get.offAllNamed(RoutesName.chooseFillDtlScreen);
        }
      }else{
        Get.snackbar(
            'Job Preferences', '$result',
            backgroundColor: textfeildborder);
      }


    }else{
      buttonLoader.value=false;
      Get.snackbar(
          'Job Preferences', '$result',
          backgroundColor: textfeildborder);
    }
  }
}