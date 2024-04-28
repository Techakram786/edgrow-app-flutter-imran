import 'package:edgrow_app/authentication/controllers/internet_connectivity_controller.dart';
import 'package:get/get.dart';

class DependendencyInjection{

  static void init(){
    Get.put<InternetConnectivityController>(InternetConnectivityController(),permanent: true);
  }
}