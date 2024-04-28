// ignore_for_file: use_build_context_synchronously


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'GoSpecificScreen.dart';
import 'PayLoadModel/NavigationDetails.dart';

mixin SetupInteractMessage {
   static void setupInteractMessage(BuildContext context) async {
    RemoteMessage? payloads =
        await FirebaseMessaging.instance.getInitialMessage();

    if (payloads != null) {
      final navigationDetailsModel =
          NavigationDetailsModel.fromJson(payloads.data);

      goSpecificScreen(
          context: context, navigationDetailsModel: navigationDetailsModel);

      // This Method is When Run Then App is BackGround
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        goSpecificScreen(
            context: context, navigationDetailsModel: navigationDetailsModel);
      });
    }
  }
}
