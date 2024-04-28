import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../model/language_model.dart';
import '../repo/language_repo.dart';

class LanguageController extends GetxController{
  final _apiRepo = LanguageRepository();
  var languageList= <LanguageModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  final RxBool isSearch = false.obs;
  RxList<LanguageModel> filteredList= RxList<LanguageModel>();
  RxList<int> selectedIndex = <int>[].obs;
  late List<String> updatedLang;
  @override
  void onInit() {
    super.onInit();
      updatedLang= Get.arguments['updated_lang'];

    getLangApi();
  }

  void getLangApi()async{
    screenLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    languageList.clear();
    var result = await _apiRepo.getLanguage(token!);

    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        languageList.value=result.map((data) => LanguageModel.fromJson(data)).toList();
        selectedIndex.value = List.filled(languageList.length, 0).obs;
        if(updatedLang.isNotEmpty){
          for (var updatedItem in updatedLang) {
            for (var apiList in languageList) {
              if(apiList.language==updatedItem){
                selectedIndex.add(apiList.id!);

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
          'Language', '$result',
          backgroundColor: textfeildborder);
    }
  }

  void updateLanguageApi({
    required List<String> loc,
  })async{
    buttonLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);

    var params=ApiHeaders.updateLanguage( loc:loc);
    var result = await _apiRepo.updateLanguage(params: params, token: token!);
    print('result final $result');
    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Preferred Location', 'location Updated Successfully',
            backgroundColor: textfeildborder);
        Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
        Get.offNamed(RoutesName.edgrowProfileScreen,);
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