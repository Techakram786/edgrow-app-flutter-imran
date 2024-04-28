import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';

import '../model/hobbies_model.dart';
import '../repo/hobbies_repo.dart';


class HobbiesController extends GetxController{
  final _apiRepo = HobbiesRepository();
  var hobbiesList= <HobbiesModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  final RxBool isSearch = false.obs;
  RxList<HobbiesModel> filteredList= RxList<HobbiesModel>();
  RxList<int> selectedIndex = <int>[].obs;
  late List<String> updatedHobby;
  @override
  void onInit() {
    super.onInit();
    updatedHobby= Get.arguments['updated_hobby'];
    getHobbyApi();
  }

  getHobbyApi()async{
    screenLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    hobbiesList.clear();
    var result = await _apiRepo.getHobbies(token!);

    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        hobbiesList.value=result.map((data) => HobbiesModel.fromJson(data)).toList();
        selectedIndex.value = List.filled(hobbiesList.length, 0).obs;
        if(updatedHobby.isNotEmpty){
          for (var updatedItem in updatedHobby) {
            for (var apiList in hobbiesList) {
              if(apiList.hobby==updatedItem){
                selectedIndex.add(apiList.id!);

              }
            }
          }
        }
      }
    }else{
      screenLoader.value=false;
      Get.snackbar(
          'Hobbies', '$result',
          backgroundColor: textfeildborder);
    }
  }

  updateHobbyApi({
    required List<String> list,
  })async{
    buttonLoader.value=true;
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);

    var params=ApiHeaders.updateHobby( list:list);
    var result = await _apiRepo.updateHobbies(params: params, token: token!);
    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Hobby', 'Hobbies Updated Successfully',
            backgroundColor: textfeildborder);
        Get.until((route) => route.settings.name ==RoutesName.edgrowProfileScreen);
        Get.offNamed(RoutesName.edgrowProfileScreen);
      }else{
        Get.snackbar(
            'Hobbies', '$result',
            backgroundColor: textfeildborder);
      }


    }else{
      buttonLoader.value=false;
      Get.snackbar(
          'Hobbies', '$result',
          backgroundColor: textfeildborder);
    }
  }
}