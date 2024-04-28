


import 'package:edgrow_app/bottomnavigationbar/bottom_screens/myprofile/screens/edgrow_profile/model/jobtype_model.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/edgrow_profile_model.dart';
import '../model/edu_dtl_model.dart';
import '../model/hobbies_model.dart';
import '../model/language_model.dart';
import '../model/profile_banner_model.dart';
import '../model/skill_dtl_model.dart';
import '../model/work_exp_dtlmodel.dart';
import '../repo/edgrow_profile_repo.dart';
import 'package:dio/dio.dart' as data;
class EdgrowController extends GetxController{

  final _apiRepo = EdgrowProfileRepository();
  Rx<EdgrowProfileModel>? edgrowProfileModel;
  var workExpList = <WorkExpDtlModel>[].obs;
  var eduDtlList = <EduDtlModel>[].obs;
  SkillDtlModel? skillDtlModel;
  var skillList = <String>[].obs;
  LanguageModel? languageModel;
  var languageList = <String>[].obs;
  HobbiesModel? hobbiesModel;
  var hobbiesList = <String>[].obs;
  JobTypeModel? jobTypeModel;
  var jobTypeList = <String>[].obs;
  var bannerList = <ProfileBannerModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;



  @override
  void onInit() {
    super.onInit();
    getEdgrowProfileApi();



  }
  Future<void> fetchAllData() async {
    try {
      screenLoader.value = true;
      // Call all API functions concurrently using Future.wait
      await Future.wait([

        getProfileBannersApi(),
        getWorkExpApi(),
        getEduDtlApi(),
        getSkillDtlApi(),
        getLangDtlApi(),
        getHobbiesDtlApi(),
        getJobTypeDtlApi(),

      ]);
    } catch (e) {
      // Handle errors here
      print('Error during parallel API calls: $e');
    }finally {
      // Set loading to false after API calls are complete (whether successful or not)
      screenLoader.value = false;
    }
  }
  void updateProfilePicApi({required data.MultipartFile  profilePic})async{
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params=ApiHeaders.updateProfilePic(
        img: profilePic
    );
    var result = await _apiRepo.updateProfilePic( token!,params);
    if (result != null) {
      edgrowProfileModel?.value.profilePicture=result.toString();
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }


  Future<void> getEdgrowProfileApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getEdgrowProfile( token!);
    if (result != null) {

      if (result is Map<String, dynamic>) {
        edgrowProfileModel =EdgrowProfileModel.fromJson(result).obs;
        // getProfileBannersApi();
        fetchAllData();

      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }
  Future<void> getProfileBannersApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getProfileBanner( token!);
    if (result != null) {

      if (result is List) {
        bannerList.value =result.map((data) => ProfileBannerModel.fromJson(data)).toList();

        // getWorkExpApi();
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }
  Future<void> getWorkExpApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getWorkExp( token!);
    if (result != null) {

      if (result is List) {
        workExpList.value =result.map((data) => WorkExpDtlModel.fromJson(data)).toList();
        // getEduDtlApi();
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }

  Future<void> getEduDtlApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getEduDtl( token!);
    if (result != null) {

      if (result is List) {
        eduDtlList.value =result.map((data) => EduDtlModel.fromJson(data)).toList();
        // getSkillDtlApi();
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }

  Future<void> getSkillDtlApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getSkill( token!);
    if (result != null) {
      if (result is Map<String, dynamic>) {
        skillDtlModel =SkillDtlModel.fromJson(result);
        if(skillDtlModel!.skillNames!.isNotEmpty){
          skillList.value=skillDtlModel!.skillNames!;
        }
        // getLangDtlApi();
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }

  Future<void> getLangDtlApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getLanguage( token!);
    if (result != null) {

      if (result is Map<String, dynamic>) {
        languageModel=LanguageModel.fromJson(result);
        if(languageModel!.languagesNames!.isNotEmpty){
          languageList.value=languageModel!.languagesNames!;
        }

        // getHobbiesDtlApi();
      } else {
        screenLoader.value = false;
       /* Get.snackbar(
            "Edgrow Profile", "$result",
            backgroundColor: textfeildborder);*/
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }
  Future<void> getHobbiesDtlApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getHobbies( token!);
    if (result != null) {

      if (result is Map<String, dynamic>) {
        hobbiesModel=HobbiesModel.fromJson(result);
        if(hobbiesModel!.hobbiesNames!.isNotEmpty){
          hobbiesList.value=hobbiesModel!.hobbiesNames!;
        }
        // getJobTypeDtlApi();
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }
  Future<void> getJobTypeDtlApi()async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getJobDtl( token!);
    if (result != null) {

      if (result is Map<String, dynamic>) {
        jobTypeModel=JobTypeModel.fromJson(result);
        if(jobTypeModel!.jobTypesNames!.isNotEmpty){
          jobTypeList.value=jobTypeModel!.jobTypesNames!;
        }
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }
  Future<void> deleteWorkExpDtlApi({required String workExpId})async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params=ApiHeaders.deleteWorkExpDtl(
        workExpId: workExpId
    );
    var result = await _apiRepo.deleteWorkExpDtl( token!,params);
    if (result != null) {

      if (result) {
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }

  Future<void> deleteEduDtlApi({required String eduId})async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params=ApiHeaders.deleteEduDtl(
        eduId: eduId
    );
    var result = await _apiRepo.deleteEduDtl( token!,params);
    if (result != null) {

      if (result) {

      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Edgrow Profile', '$result',
            backgroundColor: textfeildborder);
      }
      screenLoader.value = false;
    }else{
      screenLoader.value = false;
    }
  }

}