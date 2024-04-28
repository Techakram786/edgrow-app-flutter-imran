import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edgrow_app/Utils/internet_disconnect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class InternetConnectivityController extends GetxController{
  var connectionType = 0.obs;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;
  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        _navigateBackIfDisconnected();

        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        _navigateBackIfDisconnected();
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        _navigateToInternetDisconnectScreen();

        break;
      default:

        break;
    }
  }

  void _navigateToInternetDisconnectScreen() {
    Get.to(() => const InternetDisconnect());
  }

  void _navigateBackIfDisconnected() {
    /*if (Navigator.canPop(Get.context!)) {
      // Check if there's a route to pop (InternetDisconnect screen is open)
      Navigator.pop(Get.context!);
    }*/

    Get.back();
  }
  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}