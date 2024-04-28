


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';

import '../model/data.dart';
import '../model/job_skill_model.dart';
import '../repo/job_skill_repo.dart';

class SkillJobController extends GetxController{

  final _apiRepo = JobSkillRepository();
  final _apiCommonRepo = CommonApiRepository();
  JobSkillModel? jobSkillModel;
  var jobSkillList = <Data>[].obs;
 /* HomeDataModel? homeSkipData;
  TopBanner? topBannerData;
  TopBanner? middleBannerData;
  var trendingJobList = <TrendingJobs>[].obs;
  var topCoursesList = <TopCourses>[].obs;
  var bottomSliderList = <TopBanner>[].obs;*/
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  var pageLoader=false.obs;
  var page=1;
  var currentItem=0;
  var totalItem=0;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    getSkillJobApi(page: page.toString());


    scrollController.addListener(() {
      print('abc');
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('abc2 $currentItem $totalItem');
        if(currentItem<totalItem){
          print('abc2 $currentItem $totalItem');
          page=page +1;
          getSkillJobApi(page: page.toString());
        }else{
          pageLoader.value=false;
        }
      }else{
        pageLoader.value=false;
      }
    });

  }

  Future<void> getSkillJobApi({required String page})async {
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }

    // homeSkipData.clear();
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.jobRecommended(
      page: page,
    );
    var result = await _apiRepo.getJobSkill(params, token!);
    // print('result final $result');
    if (result != null) {
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>) {
         jobSkillModel =JobSkillModel.fromJson(result);
        totalItem=jobSkillModel!.total!;
        currentItem=jobSkillModel!.to!;
        if(jobSkillModel!.data!.isNotEmpty ){
          // recommendedJobList.value=recommendedJobModel!.data!;
          jobSkillList.addAll(jobSkillModel!.data!);
        }
      } else {
        if(page=='1'){
          screenLoader.value = false;
        }else{
          pageLoader.value = false;
        }
        Get.snackbar(
            'Job', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
    }
  }

  Future<bool> setSavedItemApi({
    required String itemId,
    required String itemType,
  }) async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
      key: SecureStorage.accessToken,
    );
    var params = ApiHeaders.itemSavedRemoved(
      itemId: itemId,
      itemType: itemType,
    );
    var result = await _apiCommonRepo.saveItem(token!, params);

    screenLoader.value = false;

    if (result != null && result == true) {
      return true;
    } else {
      Get.snackbar(
        'Saved Item',
        '$result',
        backgroundColor: textfeildborder,
      );
      return false;
    }
  }


  Future<bool> setRemovedItemApi({
    required String itemId,
    required String itemType,
  }) async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
      key: SecureStorage.accessToken,
    );
    var params = ApiHeaders.itemSavedRemoved(
      itemId: itemId,
      itemType: itemType,
    );
    var result = await _apiCommonRepo.removeItem(token!, params);

    screenLoader.value = false;

    if (result != null && result == true) {
      return true;
    } else {
      Get.snackbar(
        'Remove Item',
        '$result',
        backgroundColor: textfeildborder,
      );
      return false;
    }
  }
}