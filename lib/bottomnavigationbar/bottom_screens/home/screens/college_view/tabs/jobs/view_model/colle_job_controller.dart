


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../../../commons/common_colors.dart';
import '../../../../../../../../commons/local_storage/SecureStorage.dart';
import '../model/coll_job_model.dart';
import '../../../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../../../network/ApiConstant/api_headers.dart';


import '../model/Data.dart';
import '../repo/coll_job_repo.dart';



class CollegeJobController extends GetxController{

  final _apiRepo = CollejobRepository();
  final _apiCommonRepo = CommonApiRepository();
  CollJobModel? collJobModel;
  var jobList = <Data>[].obs;
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
    String collegeId= Get.arguments['collegeId'];
    getCollJobApi(collegeId: collegeId,page: page.toString());


    scrollController.addListener(() {

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if(currentItem<totalItem){
          page=page +1;
          getCollJobApi(collegeId:collegeId,page:  page.toString());
        }else{
          pageLoader.value=false;
        }
      }else{
        pageLoader.value=false;
      }
    });

  }

  getCollJobApi({
    required String collegeId,
    required String page})async {
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.collegeJobs(
      collegeId: collegeId,
      page: page,
    );
    var result = await _apiRepo.getColleJobs(params, token!);
    // print('result final $result');
    if (result != null) {
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>) {
        collJobModel =CollJobModel.fromJson(result);
        totalItem=collJobModel!.total!;
        currentItem=collJobModel!.to!;
        if(collJobModel!.data!.isNotEmpty ){
          // recommendedJobList.value=recommendedJobModel!.data!;
          jobList.addAll(collJobModel!.data!);
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