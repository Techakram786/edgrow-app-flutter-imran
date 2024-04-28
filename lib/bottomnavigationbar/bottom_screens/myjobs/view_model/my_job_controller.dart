
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../models/MyJobData.dart';
import '../models/MyJobModel.dart';
import '../repo/my_job-repo.dart';


class MyJobController extends GetxController{

  final _apiRepo = MyJobRepository();
  MyJobModel? myJobModel;
  var myJobList = <MyJobData>[].obs;
  RxString jobType='applied'.obs;
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
    getMyJobs(page: page.toString(),jobType: jobType.toString());


    scrollController.addListener(() {

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if(currentItem<totalItem){
          page=page +1;
          getMyJobs(page: page.toString(),jobType: jobType.toString());
        }else{
          pageLoader.value=false;

        }
      }else{
        pageLoader.value=false;
      }
    });

  }

  getMyJobs({
    required String page,
    required String jobType,
  })async {
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.myJob(
      page: page, type:jobType,
    );
    var result = await _apiRepo.getMyJob(params, token!);
    // print('result final $result');
    if (result != null) {
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>) {
         myJobModel =MyJobModel.fromJson(result);
        totalItem=myJobModel!.total!;
        currentItem=myJobModel!.to!;
        if(myJobModel!.data!.isNotEmpty ){
          myJobList.addAll(myJobModel!.data!);
        }
      } else {
        if(page=='1'){
          screenLoader.value = false;
        }else{
          pageLoader.value = false;
        }
        Get.snackbar(
            'My Job', '$result',
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