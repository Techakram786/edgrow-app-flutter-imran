
import 'package:edgrow_app/spalshscreen/view_model/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Service/Notification/FirebaseInialization.dart';
import '../../Service/Notification/NotificationPermissions.dart';
import '../../Service/Notification/forgroundMessage.dart';
import '../../Service/Notification/setupInteractMessage.dart';





class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
   final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    NotificationPermissions.requestNotificationPermission();
    ForegroundMessage.foregroundMessages();
    FirebaseInitialization.firebaseInit(context);
    SetupInteractMessage.setupInteractMessage(context);
    return Scaffold(
      // backgroundColor: whitecolor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/spalshbg.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/edgrow_spalsh.png',
                width: 300,
                height: 300,
                // color: appbarColor,
              ),
              //SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
