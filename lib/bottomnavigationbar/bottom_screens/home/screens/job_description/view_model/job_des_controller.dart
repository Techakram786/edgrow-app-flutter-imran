


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/data.dart';
import '../model/similar_job_model.dart';
import '../repo/job_des_repo.dart';

class DesJobController extends GetxController{

  final _apiRepo = JobDesRepository();
  SimilarJobModel? similarJobModel;
  var jobSimilarList = <Data>[].obs;
  RxString? myjobId=''.obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  var pageLoader=false.obs;
  var page=1;
  var currentItem=0;
  var totalItem=0;
  ScrollController scrollController = ScrollController();
  final _apiCommonRepo = CommonApiRepository();
  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if(currentItem<totalItem){
          page=page +1;
          getSimilarJobApi(page: page.toString(), jobId:myjobId.toString());
        }else{
          pageLoader.value=false;
        }
      }else{
        pageLoader.value=false;
      }
    });

  }

  getSimilarJobApi({
    required String? page,
    required String? jobId
  })async {

    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }

    // homeSkipData.clear();
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    if(page !=null && jobId!=null){
      myjobId?.value=jobId;
      var params = ApiHeaders.similarJob(
        page: page, jobId: jobId,
      );
      var result = await _apiRepo.getSimilarJob(params, token!);
      // print('result final $result');
      if (result != null) {
        if(page=='1'){
          screenLoader.value = false;
        }else{
          pageLoader.value = false;
        }
        if (result is Map<String, dynamic>) {
          similarJobModel =SimilarJobModel.fromJson(result);
          totalItem=similarJobModel!.total!;
          currentItem=similarJobModel!.to!;
          if(similarJobModel!.data!.isNotEmpty ){
            // recommendedJobList.value=recommendedJobModel!.data!;
            jobSimilarList.addAll(similarJobModel!.data!);
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