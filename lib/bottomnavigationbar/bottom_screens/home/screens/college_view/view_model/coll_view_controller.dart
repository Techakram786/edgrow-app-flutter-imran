
import 'package:edgrow_app/bottomnavigationbar/bottom_screens/home/screens/college_view/model/CollegeDtlModel.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../repo/coll_view_repo.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';



class CollegeViewController extends GetxController{

  final _apiRepo = CollegeViewRepository();
  final _apiCommonRepo = CommonApiRepository();
  CollegeDtlModel? collegeDtlModel;

   var screenLoader=false.obs;
  var buttonLoader=false.obs;


  @override
  void onInit() {
    super.onInit();
   String? collegeId= Get.arguments['collegeId'];
   if(collegeId!=null){
     getCollegeDtlApi(collegeid:collegeId);
   }

  }

  getCollegeDtlApi({required String collegeid})async {
    screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.collegeDtl(
      collegeId: collegeid,
    );
    var result = await _apiRepo.getCollegeDtl(params, token!);
    // print('result final $result');
    if (result != null) {
      screenLoader.value = false;
      if (result is Map<String, dynamic>) {
         collegeDtlModel =CollegeDtlModel.fromJson(result);

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