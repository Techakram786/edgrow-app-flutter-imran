


import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/college_view/tabs/overview/model/overview_model.dart';
import 'package:get/get.dart';

import '../../../../../../../../commons/common_colors.dart';
import '../../../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../../../network/ApiConstant/api_headers.dart';
import '../repo/overview_repo.dart';


class OverviewController extends GetxController{

  final _apiRepo = OverviewRepository();
  OverviewModel? overviewModel;
  var collegeImageList = <String>[].obs;
  // var jobSkillList = <Data>[].obs;
 /* HomeDataModel? homeSkipData;
  TopBanner? topBannerData;
  TopBanner? middleBannerData;
  var trendingJobList = <TrendingJobs>[].obs;
  var topCoursesList = <TopCourses>[].obs;
  var bottomSliderList = <TopBanner>[].obs;*/
  var screenLoader=false.obs;
  var buttonLoader=false.obs;


  @override
  void onInit() {
    super.onInit();
    String collegeId= Get.arguments['collegeId'];
    getOverViewApi(collegeId: collegeId);



  }

  getOverViewApi({required String collegeId})async {
    screenLoader.value = true;
    // homeSkipData.clear();
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.collegeDtl(
      collegeId: collegeId,
    );
    var result = await _apiRepo.getOverview(params, token!);
    // print('result final $result');
    if (result != null) {
      screenLoader.value = false;
      if (result is Map<String, dynamic>) {
         overviewModel =OverviewModel.fromJson(result);
         if(overviewModel!.collegeImages!.isNotEmpty){
           collegeImageList.value=overviewModel!.collegeImages!;
         }
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'College View', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value = false;
    }
  }
}