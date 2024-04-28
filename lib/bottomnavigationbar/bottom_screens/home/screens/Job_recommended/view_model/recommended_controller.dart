
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/Job_recommended/model/data.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/Job_recommended/model/recommended_jobmodel.dart';
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/Job_recommended/repo/job_recomm_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';

class RecommendedJobController extends GetxController{

  final _apiRepo = JobRecommendedRepository();
  RecommendedJobModel? recommendedJobModel;
  final _apiCommonRepo = CommonApiRepository();
  var recommendedJobList = <Data>[].obs;
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
    getRecommendedJobApi(page: page.toString());


    scrollController.addListener(() {

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if(currentItem<totalItem){
          page=page +1;
          getRecommendedJobApi(page: page.toString());
        }else{
          pageLoader.value=false;

        }
      }else{
        pageLoader.value=false;
      }
    });

  }

  getRecommendedJobApi({required String page})async {
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
    var result = await _apiRepo.getJobRecommended(params, token!);
    // print('result final $result');
    if (result != null) {
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>) {
         recommendedJobModel =RecommendedJobModel.fromJson(result);
        totalItem=recommendedJobModel!.total!;
        currentItem=recommendedJobModel!.to!;
        if(recommendedJobModel!.data!.isNotEmpty ){
          // recommendedJobList.value=recommendedJobModel!.data!;
          recommendedJobList.addAll(recommendedJobModel!.data!);
        }
      } else {
        if(page=='1'){
          screenLoader.value = false;
        }else{
          pageLoader.value = false;
        }
        Get.snackbar(
            'Home', '$result',
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
  // saved Or remove

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