


import 'package:edgrow_app/bottomnavigationbar/bottom_screens/myjobs/screens/job_dtl/model/TimeLineModel.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/JobDetailStatus.dart';
import '../model/SimilarJobData.dart';
import '../repo/job_dtl_repo.dart';

class JobAppDtlController extends GetxController{

  final _apiRepo = JobAppDtlRepository();
  final _apiCommonRepo = CommonApiRepository();
  JobApplDtl? jobApplDtl;
  var similarJobList = <SimilarJobs>[].obs;
  TimeLine? timeline;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
   late final String jobAppId;
  @override
  void onInit() {
     jobAppId = Get.arguments['jobAppId'];

    getJobApplDtlApi(jobApplId: jobAppId);
    super.onInit();
  }

  getJobApplDtlApi({required String jobApplId})async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.jobApplDtl(
      jobApplId: jobApplId,
    );
    var result = await _apiRepo.getJobAppDtl(params, token!);

    if (result != null) {

      if (result is Map<String, dynamic>) {
        jobApplDtl =JobApplDtl.fromJson(result);
        if(jobApplDtl!.similarJobs!.isNotEmpty){
          similarJobList.value=jobApplDtl!.similarJobs!;
        }
        if(jobApplDtl!.timeLine!=null){
          timeline=jobApplDtl!.timeLine;
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