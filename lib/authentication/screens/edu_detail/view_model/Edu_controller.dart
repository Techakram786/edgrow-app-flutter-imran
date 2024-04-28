import 'package:edgrow_app/authentication/screens/edu_detail/repository/edu_repo.dart';
import 'package:edgrow_app/network/ApiConstant/api_error_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../bottomnavigationbar/bottom_screens/myprofile/screens/edgrow_profile/model/edu_dtl_model.dart';
import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../../upload_cv/view/Upload_cv_resume_screen.dart';




class EducationDtlController extends GetxController{
  final _apiRepo = EducationDtlRepository();
  var buttonLoader=false.obs;
  late String screenType;
  EduDtlModel? eduDtlModel;
  final List<TextEditingController> highestqualificationcontroller = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> coursecontroller = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> coursetypecontroller = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> specialtypecontroller = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> universitycontroller = List.generate(10, (_) => TextEditingController());
  final List<TextEditingController> cgpacontroller = List.generate(10, (_) => TextEditingController());
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
      eduEditDtlApi(eduId: id);
    }


  }

 Future<void> addEduDtlApi({
    required String highestQualification,
    required String course,
    required String courseType,
    required String specialization,
    required String universityName,
    required String marks,
    required String startYear,
    required String endYear,
    required String currentlyStdy,
    required BuildContext context,
    required String callType
  }) async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);
    var params=ApiHeaders.addEduDtl(
      userId: userId!, highestQualification: highestQualification, course: course, courseType: courseType,
      specialization: specialization, universityName: universityName, marks: marks, startYear:startYear,
      endYear: endYear, currentlyStdy: currentlyStdy,


    );
    var result = await _apiRepo.addEduDtl(params: params);

    if(result!=null){
      buttonLoader.value=false;
      if (result==true) {
        Get.snackbar(
            'Education Details', 'Education Details Updated Successfully',
            backgroundColor: textfeildborder);
        /*Get.to(() => FillDetailsToProfileScreen(),
            transition: Transition.cupertino);*/
        if(screenType=='Add'){
          if(callType=='submit'){
            Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
            Get.offNamed(RoutesName.edgrowProfileScreen);
          }

        }else{
          if(callType=='submit'){
            if(SecureStorage.get(key: SecureStorage.contactInfo)==1 && SecureStorage.get(key: SecureStorage.eduDtl)==1 && SecureStorage.get(key: SecureStorage.keySkill)==1
                && SecureStorage.get(key: SecureStorage.jobPref)==1 && SecureStorage.get(key: SecureStorage.preferedLoc)==1 && SecureStorage.get(key: SecureStorage.expSalary)==1
                && SecureStorage.get(key: SecureStorage.resume)==1 ){
              completeAccount(context);
            }else{
              Get.offAllNamed(RoutesName.chooseFillDtlScreen);
            }
          }

        }

      }else{
        Get.snackbar(
            'Education Details', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Education Details', '$result',
          backgroundColor: textfeildborder);
      buttonLoader.value=false;
    }
  }

  Future<void> eduEditDtlApi({
    required String eduId,

  }) async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.eduEditDtl(
      eduId: eduId
    );
    var result = await _apiRepo.eduEditDtl(params: params, token: token!);

    if(result!=null){
      buttonLoader.value=false;
      if (result is Map<String, dynamic>) {
        eduDtlModel =EduDtlModel.fromJson(result);
        highestqualificationcontroller[0].text=eduDtlModel!.highestQualification!;
        coursecontroller[0].text=eduDtlModel!.course!;
        coursetypecontroller[0].text=eduDtlModel!.courseType!;
        specialtypecontroller[0].text=eduDtlModel!.specialization!;
        universitycontroller[0].text=eduDtlModel!.universityName!;
        cgpacontroller[0].text=eduDtlModel!.marks!;
        startYearController[0].text=eduDtlModel!.startYear!.toString();
        endYearController[0].text=eduDtlModel!.endYear!.toString();
        isChecked[0].value=eduDtlModel!.currentlyStudying==0?false:true;
      }else{
        Get.snackbar(
            'Education Details', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Education Details', '$result',
          backgroundColor: textfeildborder);
      buttonLoader.value=false;
    }
  }
  Future<void> updateEduDtlApi({
    required String eduId,
    required String highestQualification,
    required String course,
    required String courseType,
    required String specialization,
    required String universityName,
    required String marks,
    required String startYear,
    required String endYear,
    required String currentlyStdy,
  }) async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.updateEduDtl(
      eduId: eduId, highestQualification: highestQualification, course: course, courseType: courseType,
      specialization: specialization, universityName: universityName, marks: marks, startYear:startYear,
      endYear: endYear, currentlyStdy: currentlyStdy,
    );
    var result = await _apiRepo.updateEduDtl(params: params, token: token!);

    if(result!=null){
      buttonLoader.value=false;
      if (result==true) {
        Get.snackbar(
            'Education Details', 'Education Details Updated Successfully',
            backgroundColor: textfeildborder);
        Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
        Get.offNamed(RoutesName.edgrowProfileScreen);

      }else{
        Get.snackbar(
            'Education Details', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      Get.snackbar(
          'Education Details', '$result',
          backgroundColor: textfeildborder);
      buttonLoader.value=false;
    }
  }
}