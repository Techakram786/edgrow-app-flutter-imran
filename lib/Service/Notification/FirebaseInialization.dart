// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

import 'FlutterLocalNotification.dart';
import 'PayLoadModel/NavigationDetails.dart';
import 'ShowNotification.dart';

 mixin FirebaseInitialization {
  static Future<void> firebaseInit(BuildContext context) async {
    debugPrint('** Firebase Initialization **');
    await Firebase.initializeApp();
    FirebaseMessaging.onMessage.listen((payloads) async{

      // debugPrint('Notification Type is :->'+payloads.data["type"]);
      debugPrint('* Payloads *');
      debugPrint(payloads.toMap().toString());
      debugPrint('* Title *');
      debugPrint('${payloads.notification?.title}');
      debugPrint('* Body *');
      debugPrint('${payloads.notification?.body}');
      debugPrint('* Data *');
      // debugPrint('${payloads.data}');
      RemoteNotification? notification = payloads.notification ;
      AndroidNotification? android = payloads.notification?.android ;
      if(android != null && notification != null){
        if (Platform.isAndroid) {
         final navigationDetailsModel = NavigationDetailsModel.fromJson(payloads.data);
          FlutterLocalNotification.initLocalNotification(context, navigationDetailsModel);
          ShowNotification.show(payloads);
        }
        if (Platform.isIOS) {
          await FirebaseMessaging.instance
              .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );
        }
      }
    });
  }
}
