
import 'package:edgrow_app/onboardScreens/models/boarding_data.dart';
import 'package:edgrow_app/onboardScreens/repository/boarding_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/routes/routes_name.dart';



class OnboardingController extends GetxController {
  final _apiRepo = BoardingRepository();
  var selectpageindex = 0.obs;
  bool get isLastpage => selectpageindex.value == boardingData.length - 1;
  var pageController = PageController();
  var boardingData = <BoardingData>[].obs;
  var screenLoader=false.obs;

  @override
  void onInit() {
    super.onInit();
    getBoardingData();
  }

  forwardAction() {
    if (isLastpage) {
      //go to homepage
      Get.offAllNamed(RoutesName.chooseLoginScreen);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }



  getBoardingData()async{
    boardingData.clear();
    screenLoader.value=true;
    var result = await _apiRepo.getApiBoarding();
    print('result final $result');
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        boardingData.value=result.map((data) => BoardingData.fromJson(data)).toList();
      }else{
        print('no data found $result');
      }
    }else{
      screenLoader.value=false;
    }
  }
}
