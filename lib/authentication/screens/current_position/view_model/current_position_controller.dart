
import 'package:edgrow_app/authentication/screens/current_position/repository/current_position_repo.dart';
import 'package:edgrow_app/commons/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../../../commons/local_storage/SecureStorage.dart';
import '../../../../network/ApiConstant/api_headers.dart';
import '../model/CurrentPositionModel.dart';

class CurrentPositionController extends GetxController{
  final _apiRepo = CurrentPositionRepository();
  var currentPositionData = <CurrentPositionMode>[].obs;
  RxInt selectedindex = (-1).obs;
  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  @override
  void onInit() {
    super.onInit();
    getCurrentPositionData();
  }


  getCurrentPositionData() async{
    screenLoader.value=true;
    currentPositionData.clear();
    var result = await _apiRepo.getCurrentPosition();
    if(result!=null){
      screenLoader.value=false;
      if (result is List) {
        currentPositionData.value=result.map((data) => CurrentPositionMode.fromJson(data)).toList();
      }else{
        print('no data found $result');
      }
    }else{
      screenLoader.value=false;
    }
  }

  setCurrentPositionData({required String currentPositionId}) async{
    buttonLoader.value=true;
    final String? userId=await SecureStorage.get(key: SecureStorage.appUserId);
    var params=ApiHeaders.setCurrentPosition(
        userId: userId!,
        postionId: currentPositionId,

    );
    var result = await _apiRepo.setCurrentPosition(params: params);

    if(result!=null){
      buttonLoader.value=false;
      if (result) {
        /*Get.to(() => const FillDetailsToProfileScreen(),
            transition: Transition.rightToLeft);*/
        Get.toNamed(RoutesName.chooseFillDtlScreen);
      }else{
        print('no data found ');
      }
    }else{
      buttonLoader.value=false;
    }
  }
}