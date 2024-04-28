
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../model/top_courses_data.dart';


import '../../../../../../network/ApiConstant/api_headers.dart';
import '../repo/top_courses_repo.dart';




class TopCoursesController extends GetxController{

  final _apiRepo = TopCoursesRepository();
  final _apiCommonRepo = CommonApiRepository();
  var topCoursesList = <TopCoursesData>[].obs;

  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  var pageLoader=false.obs;

  @override
  void onInit() {
    super.onInit();
    getTopCoursesApi();


  }

  Future<void> getTopCoursesApi()async {
    screenLoader.value = true;
    final String? appId = await SecureStorage.get(
        key: SecureStorage.appUserId);
    var params = ApiHeaders.profileDtl(
   userId: appId!,
    );
    var result = await _apiRepo.getTopCourses(params);
    if (result != null) {
      screenLoader.value = false;
      if (result is List) {
        topCoursesList.value =result.map((data) => TopCoursesData.fromJson(data)).toList();
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'Top Courses', '$result',
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