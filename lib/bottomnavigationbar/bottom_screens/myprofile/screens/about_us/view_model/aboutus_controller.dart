


import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';

import '../../../../../../commons/model/cms_model.dart';
import '../../../../../../commons/repo/common_api_repository.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';





class AboutUsController extends GetxController{
  final _apiRepo = CommonApiRepository();
  CmsModel? cmsModel;
  var screenLoader=false.obs;


  @override
  void onInit() {
    super.onInit();
    getAboutUs();
  }

  getAboutUs()async{
  screenLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);

    var params=ApiHeaders.cms( type: 'about_us');
    var result = await _apiRepo.cms(token!, params);
   
    if(result!=null){
      screenLoader.value=false;
      if(result is Map<String, dynamic> ){
        cmsModel =CmsModel.fromJson(result);
      }else{
        Get.snackbar(
            'About us', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'About us', '$result',
          backgroundColor: textfeildborder);
    }
  }
}