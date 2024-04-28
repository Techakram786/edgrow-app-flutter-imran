import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

mixin NotificationPermissions {
  static void requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging
        .requestPermission(
            alert: true,
            announcement: true,
            badge: true,
            carPlay: true,
            criticalAlert: true,
            provisional: true,
            sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('user granted Permission is Authorized');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('user granted Permission is Provisional');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      debugPrint('user granted Permission is Denied');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      debugPrint('user granted Permission is Not Determined');
    }
  }
}
