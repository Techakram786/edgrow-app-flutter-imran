


import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';

import '../../../../../../commons/model/cms_model.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';





class PrivacyPolicyController extends GetxController{
  final _apiRepo = CommonApiRepository();
  CmsModel? cmsModel;
  var screenLoader=false.obs;


  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicy();
  }

  getPrivacyPolicy()async{
  screenLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);

    var params=ApiHeaders.cms( type: 'privacy');
    var result = await _apiRepo.cms(token!, params);
   
    if(result!=null){
      screenLoader.value=false;
      if(result is Map<String, dynamic> ){
        cmsModel =CmsModel.fromJson(result);
      }else{
        Get.snackbar(
            'Privacy Policy', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Privacy Policy', '$result',
          backgroundColor: textfeildborder);
    }
  }
}