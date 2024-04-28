
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';

import '../../../../../../network/ApiConstant/api_headers.dart';

import '../repo/career_repo.dart';



class CareerController extends GetxController{
  final _apiRepo = CareerRepo();
  var screenLoader=false.obs;
  var buttonLoader=false.obs;




  Future<void> updateProfile({
    required String carrerBrief,

  })async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);

    var params=ApiHeaders.updateCarrerBrief(  carrerbrief: carrerBrief);
    var result = await _apiRepo.updateCareerBrief(token!, params);
   
    if(result!=null){
      buttonLoader.value=false;
      if(result){
        Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
        Get.offNamed(RoutesName.edgrowProfileScreen);
      }else{
        Get.snackbar(
            'Update Profile', '$result',
            backgroundColor: textfeildborder);
      }


    }else{
      buttonLoader.value=false;
      Get.snackbar(
          'Update Profile', '$result',
          backgroundColor: textfeildborder);
    }
  }
}