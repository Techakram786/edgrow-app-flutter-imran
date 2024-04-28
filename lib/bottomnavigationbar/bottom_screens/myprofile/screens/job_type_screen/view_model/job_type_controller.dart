import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/job_type_model.dart';
import '../repo/job_type_repo.dart';

class JobTypeController extends GetxController{
  final _apiRepo = JobTypeRepository();
  var jobTypeList= <JobTypeModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  final RxBool isSearch = false.obs;
  RxList<JobTypeModel> filteredList= RxList<JobTypeModel>();
  RxList<int> selectedIndex = <int>[].obs;
  late List<String> updatedJobtype;
  @override
  void onInit() {
    super.onInit();
      updatedJobtype= Get.arguments['updated_jobType'];

    getJobTypeApi();
  }

  Future<void> getJobTypeApi()async{
    screenLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    jobTypeList.clear();
    var result = await _apiRepo.getJobType(token!);

    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        jobTypeList.value=result.map((data) => JobTypeModel.fromJson(data)).toList();
        selectedIndex.value = List.filled(jobTypeList.length, 0).obs;
        if(updatedJobtype.isNotEmpty){
          for (var updatedItem in updatedJobtype) {
            for (var apiList in jobTypeList) {
              if(apiList.jobType==updatedItem){
                selectedIndex.add(apiList.id!);

              }
            }
          }
        }
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Language', '$result',
          backgroundColor: textfeildborder);
    }
  }

  Future<void> updateJobtypeApi({
    required List<String> list,
  })async{
    buttonLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);

    var params=ApiHeaders.updateJobType( list:list);
    var result = await _apiRepo.updateJobType(params: params, token: token!);

    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Job Type', 'Updated Successfully',
            backgroundColor: textfeildborder);
        Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
        Get.offNamed(RoutesName.edgrowProfileScreen);
      }else{
        Get.snackbar(
            'Job Type', '$result',
            backgroundColor: textfeildborder);
      }


    }else{
      buttonLoader.value=false;
      Get.snackbar(
          'Job Type', '$result',
          backgroundColor: textfeildborder);
    }
  }
}