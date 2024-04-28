import 'package:edgrow_app/bottomnavigationbar/bottom_screens/myprofile/screens/notification/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/local_storage/SecureStorage.dart';
import '../../../../../../network/ApiConstant/api_headers.dart';

import '../model/notification_model.dart';

import '../repo/notification_repo.dart';

class NotificationController extends GetxController{
  final _apiRepo = NotificationRepository();
  NotificationModel? notificationModel;
  var notificationList = <Data>[].obs;
  var screenLoader=false.obs;
  var pageLoader=false.obs;
  var page=1;
  var currentItem=0;
  var totalItem=0;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getNotificationApi(page: page.toString());
    scrollController.addListener(() {

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if(currentItem<totalItem){
          page=page +1;
          getNotificationApi(page: page.toString());
        }else{
          pageLoader.value=false;

        }
      }else{
        pageLoader.value=false;
      }
    });
  }

  Future<void> getNotificationApi({
    required String page,
  })async {
    if(page=='1'){
      screenLoader.value = true;
    }else{
      pageLoader.value = true;
    }
    final String? token = await SecureStorage.get(
        key: SecureStorage.accessToken);
    var params = ApiHeaders.notification(
      page: page,
    );
    var result = await _apiRepo.getNotification(params, token!);
    // print('result final $result');
    if (result != null) {
      if(page=='1'){
        screenLoader.value = false;
      }else{
        pageLoader.value = false;
      }
      if (result is Map<String, dynamic>) {
        notificationModel =NotificationModel.fromJson(result);

        if(notificationModel!.total!=null){
          totalItem=notificationModel!.total!;
        }else{
          totalItem=0;
        }
        if(notificationModel!.to!=null){
          currentItem=notificationModel!.to!;
        }else{
          currentItem=0;
        }

        if(notificationModel!.data!.isNotEmpty ){
          notificationList.addAll(notificationModel!.data!);
        }
      } else {
        if(page=='1'){
          screenLoader.value = false;
        }else{
          pageLoader.value = false;
        }
        Get.snackbar(
            'My Job', '$result',
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