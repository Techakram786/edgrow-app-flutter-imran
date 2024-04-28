import 'package:edgrow_app/authentication/screens/pref_location/model/PrefLocModel.dart';
import 'package:edgrow_app/authentication/screens/pref_location/repository/pref_loc_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../../upload_cv/view/Upload_cv_resume_screen.dart';

class PrefLocController extends GetxController{
  final _apiRepo = PrefLocRepository();
  var prefLocData = <PrefLocModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  final RxBool isSearch = false.obs;
  RxList<PrefLocModel> filteredData= RxList<PrefLocModel>();

  RxList<int> selectedIndex = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPrefLocApi();
  }

  getPrefLocApi()async{
    screenLoader.value=true;
    prefLocData.clear();
    var result = await _apiRepo.getPrefLocation();

    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        prefLocData.value=result.map((data) => PrefLocModel.fromJson(data)).toList();
        selectedIndex.value = List.filled(prefLocData.length, 0).obs;
      }else{
        print('no data found $result');
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Preferred Location', '$result',
          backgroundColor: textfeildborder);
    }
  }

  updatePrefLocApi({
    required List<String> loc,
    required BuildContext context,
  })async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);

    var params=ApiHeaders.updatePrefLoc(appId: userId!, loc:loc);
    var result = await _apiRepo.updatePrefLoc(params: params);
    print('result final $result');
    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Preferred Location', 'location Updated Successfully',
            backgroundColor: textfeildborder);
        if(SecureStorage.get(key: SecureStorage.contactInfo)==1 && SecureStorage.get(key: SecureStorage.eduDtl)==1 && SecureStorage.get(key: SecureStorage.keySkill)==1
            && SecureStorage.get(key: SecureStorage.jobPref)==1 && SecureStorage.get(key: SecureStorage.preferedLoc)==1 && SecureStorage.get(key: SecureStorage.expSalary)==1
            && SecureStorage.get(key: SecureStorage.resume)==1 ){
          completeAccount(context);
        }else{
          Get.offAllNamed(RoutesName.chooseFillDtlScreen);
        }
      }else{
        Get.snackbar(
            'Preferred Location', '$result',
            backgroundColor: textfeildborder);
      }


    }else{
      buttonLoader.value=false;
      Get.snackbar(
          'Preferred Location', '$result',
          backgroundColor: textfeildborder);
    }
  }
}