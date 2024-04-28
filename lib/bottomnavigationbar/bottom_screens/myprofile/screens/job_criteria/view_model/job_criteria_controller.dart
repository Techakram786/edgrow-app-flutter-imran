import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../model/job_criteria_model.dart';
import '../repo/job_criteria_repo.dart';


class JobCriteriaController extends GetxController{
  final _apiRepo = JobCriteriaRepository();
  JobCriteriaModel? jobCriteriaModel;
  var lookingForList= <String>[].obs;
  var workTypesList= <String>[].obs;
  var locationList= <String>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  final RxBool isSearch = false.obs;
  TextEditingController controllerLookingFor = TextEditingController();
  TextEditingController controllerWorkType = TextEditingController();
  TextEditingController controllerLocationType = TextEditingController();
  TextEditingController controllerLevel = TextEditingController();
  TextEditingController controllerSalary = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    getJobCriteriaApi();
  }

  Future<void> getJobCriteriaApi()async{
    screenLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);

    var result = await _apiRepo.getJobCriteria(token!);

    if(result!=null){

      if (result is Map<String, dynamic>) {
        jobCriteriaModel =JobCriteriaModel.fromJson(result);
        if(jobCriteriaModel!.jobLookingFor!.isNotEmpty){
          lookingForList.value=jobCriteriaModel!.jobLookingFor!;
          for (int i = 0; i < lookingForList.length; i++) {
            controllerLookingFor.text += lookingForList[i];
            if (i < lookingForList.length - 1) {
              controllerLookingFor.text += ', ';
            }
          }
        }
        if(jobCriteriaModel!.typeOfWork!.isNotEmpty){
          workTypesList.value=jobCriteriaModel!.typeOfWork!;
          for (int i = 0; i < workTypesList.length; i++) {
            controllerWorkType.text += workTypesList[i];
            if (i < workTypesList.length - 1) {
              controllerWorkType.text += ', ';
            }
          }
        }
        if(jobCriteriaModel!.location!.isNotEmpty){
          locationList.value=jobCriteriaModel!.location!;
          for (int i = 0; i < locationList.length; i++) {
            controllerLocationType.text += locationList[i];
            if (i < locationList.length - 1) {
              controllerLocationType.text += ', ';
            }
          }
        }
        controllerLevel.text=jobCriteriaModel!.level!;
        controllerSalary.text=jobCriteriaModel!.expectedSalary!;
        screenLoader.value=false;
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'JobCriteria', '$result',
          backgroundColor: textfeildborder);
    }
  }


}