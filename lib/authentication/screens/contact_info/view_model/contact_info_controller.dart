import 'package:edgrow_app/authentication/screens/contact_info/model/CityModel.dart';
import 'package:edgrow_app/authentication/screens/contact_info/model/CountryModel.dart';
import 'package:edgrow_app/authentication/screens/contact_info/model/StateModel.dart';
import 'package:edgrow_app/authentication/screens/contact_info/repository/contact_info_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../commons/common_colors.dart';
import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../commons/routes/routes_name.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../../upload_cv/view/Upload_cv_resume_screen.dart';





class ContactInfoController extends GetxController{
  final _apiRepo = ContactInfoRepository();
  var countryData = <CountryModel>[].obs;
  var stateData = <StateModel>[].obs;
  var cityData = <CityModel>[].obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;


  @override
  void onInit() {
    getCountry();
    super.onInit();
  }


  getCountry()async{
    countryData.clear();
    screenLoader.value=true;
    var result = await _apiRepo.getApiCountry();
    print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        countryData.value=result.map((data) => CountryModel.fromJson(data)).toList();
        getState(countryId:  countryData[0].id.toString());
      }else{
        print('no data found $result');
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
    print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        stateData.value=result.map((data) => StateModel.fromJson(data)).toList();
      }else{
        print('no data found $result');
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
    print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        cityData.value=result.map((data) => CityModel.fromJson(data)).toList();
      }else{
        print('no data found $result');
      }
    }else{
      screenLoader.value=false;
    }
  }

  updateContact({
    required String dob,
    required String gender,
    required String countryId,
    required String stateId,
    required String cityId,
    required String address,
    required List<String> portfoli,
    required BuildContext context
  })async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);

    Object  params=ApiHeaders.contactUpdate(appId: userId!, dob: dob, gender: gender, countryId: countryId,
        stateId: stateId, cityId: cityId, address: address, portfolio:portfoli);
    var result = await _apiRepo.UpdateContactInfo(params: params);

    if(result!=null){
      buttonLoader.value=false;
      if(result==true){
        Get.snackbar(
            'Registration', 'Registration Update sucessfully',
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
            'Registration', '$result',
            backgroundColor: textfeildborder);
      }


    }else{
      buttonLoader.value=false;
      Get.snackbar(
          'Registration', '$result',
          backgroundColor: textfeildborder);
    }
  }
}