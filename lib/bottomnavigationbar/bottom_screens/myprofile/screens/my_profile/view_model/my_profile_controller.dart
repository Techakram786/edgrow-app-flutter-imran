

import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';

import '../model/myprofile_model.dart';
import '../repo/my_profile_repo.dart';



class MyProfileController extends GetxController{

  final _apiRepo = MyProfileRepository();
  MyProfileModel? myProfileModel;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  var pageLoader=false.obs;


  @override
  void onInit() {
    super.onInit();
    getMyProfile();

  }

  getMyProfile()async {
        screenLoader.value = true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var result = await _apiRepo.getMyProfile( token!);
    if (result != null) {
      screenLoader.value = false;
      if (result is Map<String, dynamic>) {
        myProfileModel =MyProfileModel.fromJson(result);
      } else {
        screenLoader.value = false;
        Get.snackbar(
            'My Job', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value = false;
    }
  }
}