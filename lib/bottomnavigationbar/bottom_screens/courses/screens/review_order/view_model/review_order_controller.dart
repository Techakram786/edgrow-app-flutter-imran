

import 'package:edgrow_app/bottomnavigationbar/bottom_screens/courses/screens/review_order/model/ReviewOrderModel.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../repo/ReviewOrderRepository.dart';



class ReviewOrderController extends GetxController{

  final _apiRepo = ReviewOrderRespository();
  ReviewOrderModel? reviewOrderModel;


  var screenLoader=false.obs;
  var buttonLoader=false.obs;

  @override
  void onInit() {
    super.onInit();
    var courseId=Get.arguments['course_Id'];
    getReviewOrderApi(courseId: courseId);

  }
  getReviewOrderApi({
    required String courseId,
  })async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.coursesDtl(
      coursesId:courseId,
    );
    var result = await _apiRepo.reviewOrder(params, token!);
    // print('result final $result');
    if (result != null) {
      screenLoader.value = false;
      if (result is Map<String, dynamic>) {
         reviewOrderModel =ReviewOrderModel.fromJson(result);

      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Review Order', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value = false;
    }
  }
}