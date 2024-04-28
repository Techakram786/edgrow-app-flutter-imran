
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';

import '../model/work_exp_model.dart';
import '../repository/work_exp_repo.dart';





class WorkExpController extends GetxController{
  final _apiRepo = WorkExpDtlRepository();
  var buttonLoader=false.obs;
  late String screenType;
  WorkExpModel? workExpModel;
  final List<TextEditingController> jobTitleController = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> companyNameController = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> salaryController = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> levelController = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> endYearController = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> startYearController = List.generate(10, (_) => TextEditingController());
  final List<RxBool> isChecked = List.generate(10, (_) => false.obs);
  RxInt myIndex= 0.obs;
  // RxBool isChecked = false.obs;
  @override
  void onInit() {
    super.onInit();
    screenType=Get.arguments['screen_type'];
    if(screenType=='edit'){
     String id=Get.arguments['edit_dtl_id'].toString();
      workExpEditDtlApi(workExpId: id);
    }


  }

 Future<void> addWorkExpDtlApi({
    required String title,
    required String companyName,
    required String salary,
    required String level,
    required String startYear,
    required String endYear,
    required String currentlyWork,
    required BuildContext context,
    required String callType
  }) async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.addWorkExpDtl(
       title: title, companyName: companyName, salary: salary,
      level: level, startYear:startYear,
      endYear: endYear, currentlyWork: currentlyWork,


    );
    var result = await _apiRepo.addWorkExpDtl(params: params,token: token!);

    if(result!=null){
      buttonLoader.value=false;
      if (result==true) {
        if(callType=='submit'){
          Get.snackbar(
              'Work Exp', ' Added Successfully',
              backgroundColor: textfeildborder);

          Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
          Get.offNamed(RoutesName.edgrowProfileScreen);
        }


      }else{
        Get.snackbar(
            'Work Exp', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Work Exp', '$result',
          backgroundColor: textfeildborder);
      buttonLoader.value=false;
    }
  }

  Future<void> workExpEditDtlApi({
    required String workExpId,

  }) async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.workExpEditDtl(
      workExpId: workExpId
    );
    var result = await _apiRepo.workExpEditDtl(params: params, token: token!);

    if(result!=null){
      buttonLoader.value=false;
      if (result is Map<String, dynamic>) {
        workExpModel =WorkExpModel.fromJson(result);
        jobTitleController[0].text=workExpModel!.title!;
        companyNameController[0].text=workExpModel!.companyName!;
        salaryController[0].text=workExpModel!.salary!.toString();
        levelController[0].text=workExpModel!.level!;
        startYearController[0].text=workExpModel!.startYear!.toString();
        endYearController[0].text=workExpModel!.endYear!.toString();
        isChecked[0].value=workExpModel!.currentlyWorking==0?false:true;
      }else{
        Get.snackbar(
            'Work Exp', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Work Exp', '$result',
          backgroundColor: textfeildborder);
      buttonLoader.value=false;
    }
  }
  Future<void> updateWorkExpDtlApi({
    required String workExpId,
    required String title,
    required String companyName,
    required String salary,
    required String level,
    required String startYear,
    required String endYear,
    required String currentlyWork,
  }) async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.updateWorkExpDtl(
      workExpId: workExpId, title: title, companyName: companyName, salary: salary,
      level: level,  startYear:startYear,
      endYear: endYear, currentlyWork: currentlyWork,
    );
    var result = await _apiRepo.updateWorkExpDtl(params: params, token: token!);

    if(result!=null){
      buttonLoader.value=false;
      if (result==true) {
        Get.snackbar(
            'Work Exp', 'Updated Successfully',
            backgroundColor: textfeildborder);
        Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
        Get.offNamed(RoutesName.edgrowProfileScreen);

      }else{
        Get.snackbar(
            'Work Exp', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Work Exp', '$result',
          backgroundColor: textfeildborder);
      buttonLoader.value=false;
    }
  }
}