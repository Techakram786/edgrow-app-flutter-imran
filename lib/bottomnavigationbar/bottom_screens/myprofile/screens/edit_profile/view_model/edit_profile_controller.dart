
import 'package:get/get.dart';

import '../../../../../../authentication/screens/current_position/model/CurrentPositionModel.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../commons/routes/routes_name.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';
import '../../edgrow_profile/model/edgrow_profile_model.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';
import '../model/state_model.dart';
import '../repository/edit_profile_repo.dart';







class EditProfileController extends GetxController{
  final _apiRepo = EditProfileRepository();
  Rx<EdgrowProfileModel>? edgrowProfileModel;

  var currentPositionData = <CurrentPositionMode>[].obs;
  var countryData = <CountryModel>[].obs;
  var stateData = <StateModel>[].obs;
  var cityData = <CityModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  CurrentPositionMode? defaultPosition;
  StateModel? defaultState;
  CityModel? defaultCity;
  RxString changeType='init'.obs;

  @override
  void onInit() {
    edgrowProfileModel=Get.arguments['profile_dtl'];
    getCurrentPositionData();

    super.onInit();
  }


  /*getCountry()async{
    countryData.clear();
    screenLoader.value=true;
    var result = await _apiRepo.getApiCountry();
    print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        countryData.value=result.map((data) => CountryModel.fromJson(data)).toList();
        getState(countryId:  countryData.value[0].id.toString());
      }else{
        print('no data found $result');
      }
    }else{
      screenLoader.value=false;
    }
  }*/
  getCurrentPositionData() async{
    screenLoader.value=true;
    currentPositionData.clear();
    var result = await _apiRepo.getCurrentPosition();
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        currentPositionData.value=result.map((data) => CurrentPositionMode.fromJson(data)).toList();
        defaultPosition =currentPositionData.firstWhere(
              (position) =>
              position.currentPositionName == edgrowProfileModel?.value.currentPositionName

        );
        defaultPosition =currentPositionData.firstWhere(
                (position) =>
            position.id == int.parse(edgrowProfileModel!.value.currentPositionId!)

        );

        getState(countryId: '101');
      }
    }else{
      screenLoader.value=false;
    }
  }

  getState({required String countryId})async{
    stateData.clear();
    screenLoader.value=true;
    var params=ApiHeaders.state(
        countryId:countryId

    );
    var result = await _apiRepo.getApiState(params: params);
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        stateData.value=result.map((data) => StateModel.fromJson(data)).toList();
        defaultState =stateData.firstWhere(
                (position) =>
            position.name == edgrowProfileModel?.value.stateName
        );
        defaultState =stateData.firstWhere(
                (position) =>
            position.id == int.parse(edgrowProfileModel!.value.stateId!)

        );
        getCity(stateId: edgrowProfileModel!.value.stateId!);
      }
    }else{
      screenLoader.value=false;
    }
  }

  getCity({required String stateId})async{
    cityData.clear();
    screenLoader.value=true;
    var params=ApiHeaders.city(
        stateId:stateId

    );
    var result = await _apiRepo.getApiCity(params: params);
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        cityData.value=result.map((data) => CityModel.fromJson(data)).toList();
        if(changeType.value=='init'){
          defaultCity =cityData.firstWhere(
                  (position) =>
              position.name == edgrowProfileModel?.value.cityName

          );
          defaultCity =cityData.firstWhere(
                  (position) =>
              position.id == int.parse(edgrowProfileModel!.value.cityId!)

          );
        }

      }
    }else{
      screenLoader.value=false;
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String mobileNo,
    required String email,
    required String currentPositionId,
    required String gender,
    required String countryId,
    required String stateId,
    required String cityId,
    required List<String> portfoli,
  })async{
    buttonLoader.value=true;
    final String? token=await SecureStorage.get(key: SecureStorage.accessToken);
    var params=ApiHeaders.updateProfile(fullName: fullName, gender: gender, countryId: countryId,
        stateId: stateId, cityId: cityId,  portfolio:portfoli, currentPostionId: currentPositionId, mobileNo: mobileNo, email: email);
    var result = await _apiRepo.updateProfile(token!, params);
   
    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Update Profile', 'Registration Update sucessfully',
            backgroundColor: textfeildborder);

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