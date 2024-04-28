import 'package:edgrow_app/authentication/screens/upload_cv/repository/upload_cv_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as data;

import '../../../../bottomnavigationbar/bottom_screens/home/screens/job_dtl/model/resume_data.dart';
import '../../../../bottomnavigationbar/bottom_screens/home/screens/job_dtl/model/resume_model.dart';
import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../view/Upload_cv_resume_screen.dart';

class UploadCvController extends GetxController{

  final _apiRepo = UploadCvRepository();
  late String screenType;
  @override
  void onInit() {
    super.onInit();
    screenType=Get.arguments['screen_type'];
    if(screenType=='existing'){
      getResumeApi();
    }

  }

  var buttonLoader=false.obs;
  var screenLoader=false.obs;
  Rx<FilePickerResult?> selectedPdf = Rx<FilePickerResult?>(null);
  ResumeModel? resumeModel;
  var resumeList = <ResumesData>[].obs;

  Future<void> pickAndUploadPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedPdf.value = result;
    }
  }

  Future<void> uploadPdf() async {
    if (selectedPdf.value != null) {
      // Implement your PDF upload logic here
      // You can use the selectedPdf.value!.files.first.path to access the PDF file path
      // Upload the PDF file to your server or perform any other desired action.
    }
  }

  Future<void> getResumeApi()async {
    screenLoader.value = true;

    // homeSkipData.clear();
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);

    var result = await _apiRepo.getResume( token!);
    // print('result final $result');
    if (result != null) {

      if (result is Map<String, dynamic>) {
        resumeModel =ResumeModel.fromJson(result);
        if(resumeModel!.resumes!.isNotEmpty){
          resumeList.value=resumeModel!.resumes!;
        }
        screenLoader.value = false;
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Job Detail', '$result',
            backgroundColor: textfeildborder);
      }

    }else{
      screenLoader.value = false;
    }
  }

  Future<void> deleteResumeApi({required resumeId})async {
    screenLoader.value = true;

    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params=ApiHeaders.deleteCv(
      resumeId: resumeId,
    );
    var result = await _apiRepo.deleteResume( token!,params);
    // print('result final $result');
    if (result != null) {

      if (result==true) {
        screenLoader.value = false;
        Get.snackbar(
            'Cv', 'Resume Deleted',
            backgroundColor: textfeildborder);
             getResumeApi();
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Cv', '$result',
            backgroundColor: textfeildborder);
      }

    }else{
      screenLoader.value = false;
    }
  }

  Future<void> uploadCvApi({
    required BuildContext context,
    required String title,
    required data.MultipartFile  file})async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);
    var params=ApiHeaders.uploadCv(
        userId: userId!,
        title: title,
        file: file,

    );

    var result = await _apiRepo.uploadCv(params:params);

    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Upload cv', 'Resume Updated Successfully',
            backgroundColor: textfeildborder);
        if(screenType=='existing'){
          getResumeApi();
        }else{
          if(SecureStorage.get(key: SecureStorage.contactInfo)==1 && SecureStorage.get(key: SecureStorage.eduDtl)==1 && SecureStorage.get(key: SecureStorage.keySkill)==1
              && SecureStorage.get(key: SecureStorage.jobPref)==1 && SecureStorage.get(key: SecureStorage.preferedLoc)==1 && SecureStorage.get(key: SecureStorage.expSalary)==1
              && SecureStorage.get(key: SecureStorage.resume)==1 ){
            completeAccount(context);
          }else{
            Get.offAllNamed(RoutesName.chooseFillDtlScreen);
          }
        }

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