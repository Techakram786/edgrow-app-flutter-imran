import 'package:edgrow_app/authentication/screens/key_skill/model/KeySkillModel.dart';
import 'package:edgrow_app/authentication/screens/key_skill/repository/KeySkillRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../../upload_cv/view/Upload_cv_resume_screen.dart';

class KeySkillController extends GetxController {

  final _apiRepo = KeySkillRepository();
  var keySkillData = <KeySkillModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  final RxBool isSearch = false.obs;
  RxList<KeySkillModel> filteredSkills = RxList<KeySkillModel>();

  RxList<int> selectedIndex = <int>[].obs;
  var screenType;
  late List<String> selectedSkill;
  @override
  void onInit() {
    super.onInit();
    getKeySillApi();
    screenType=Get.arguments['screen_type'];
    if(screenType=='EdgrowProfile'){
      selectedSkill= Get.arguments['skill_list'];
    }
  }

  void getKeySillApi()async{
    screenLoader.value=true;
    keySkillData.clear();
    var result = await _apiRepo.getSkill();

    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        keySkillData.value=result.map((data) => KeySkillModel.fromJson(data)).toList();
       // selectedIndex.assignAll(List<int>.generate( keySkillData.value.length, (index) => 0));
        selectedIndex.value = List.filled(keySkillData.length, 0).obs;
        if(screenType=='EdgrowProfile'){
          if(selectedSkill.isNotEmpty){
            for (var updatedItem in selectedSkill) {
              for (var apiList in keySkillData) {
                if(apiList.skillName==updatedItem){
                  selectedIndex.add(apiList.id!);

                }
              }
            }
          }
        }

      }else{
        print('no data found $result');
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Key Skills', '$result',
          backgroundColor: textfeildborder);
    }
  }


  void updateKeySkillApi({
    required List<String> skills,
    required BuildContext context
  })async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);

    var params=ApiHeaders.updateKeySkill(appId: userId!, keySkill:skills);
    var result = await _apiRepo.updateKeySkill(params: params);
    print('result final $result');
    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Key Skills', 'Key Skills Updated Successfully',
            backgroundColor: textfeildborder);
        if(SecureStorage.get(key: SecureStorage.contactInfo)==1 && SecureStorage.get(key: SecureStorage.eduDtl)==1 && SecureStorage.get(key: SecureStorage.keySkill)==1
            && SecureStorage.get(key: SecureStorage.jobPref)==1 && SecureStorage.get(key: SecureStorage.preferedLoc)==1 && SecureStorage.get(key: SecureStorage.expSalary)==1
            && SecureStorage.get(key: SecureStorage.resume)==1 ){
          completeAccount(context);
        }else{

          if(screenType=='FillDtl'){
            Get.offAllNamed(RoutesName.chooseFillDtlScreen);
          }else{

            Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
            Get.offNamed(RoutesName.edgrowProfileScreen);
          }
        }

      }else{
        Get.snackbar(
            'Key Skills', '$result',
            backgroundColor: textfeildborder);
      }


    }else{
      buttonLoader.value=false;
      Get.snackbar(
          'Key Skills', '$result',
          backgroundColor: textfeildborder);
    }
  }
}