
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';


import '../model/colleges_for_u_model.dart';
import '../model/data.dart';

import '../repo/coll_for_u_repo.dart';

import '../../../../../../network/ApiConstant/api_headers.dart';




class CollegesForUController extends GetxController{

  final _apiRepo = CollegesForURepository();
  CollegesForUModel? collegesForUModel;
  var collegesForUList = <Data>[].obs;

  var screenLoader=false.obs;
  var buttonLoader=false.obs;
  var pageLoader=false.obs;
  var page=1;
  var currentItem=0;
  var totalItem=0;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    getCollegesForUApi(page: page.toString());


    scrollController.addListener(() {

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if(currentItem<totalItem){
          page=page +1;
          getCollegesForUApi(page: page.toString());
        }else{
          pageLoader.value=false;

        }
      }else{
        pageLoader.value=false;
      }
    });

  }

  getCollegesForUApi({required String page})async {
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.jobRecommended(
      page: page,
    );
    var result = await _apiRepo.getCollegesForU(params, token!);
    // print('result final $result');
    if (result != null) {
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>) {
         collegesForUModel =CollegesForUModel.fromJson(result);
        totalItem=collegesForUModel!.total!;
        currentItem=collegesForUModel!.to!;
        if(collegesForUModel!.data!.isNotEmpty ){
          collegesForUList.addAll(collegesForUModel!.data!);
        }
      } else {
        if(page=='1'){
          screenLoader.value = false;
        }else{
          pageLoader.value = false;
        }
        Get.snackbar(
            'College For You', '$result',
            backgroundColor: textfeildborder);
      }
    }else{
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
    }
  }
}