import 'package:edgrow_app/commons/local_storage/SecureStorage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

mixin NotificationDeviceToken {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    static Future<String> notificationDeviceToken() async {
    String? deviceToken = await  _firebaseMessaging.getToken();
    debugPrint('Notification Device Token');
    debugPrint('Token :- $deviceToken');
    SecureStorage.write(key: SecureStorage.deviceToken, value: deviceToken!);
    return deviceToken;
  }

  static deviceTokenRefresh() {
    _firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
      SecureStorage.write(key: SecureStorage.deviceToken, value: event.toString());
      print('deviceToken ${event.toString()}');
    });
  }
}
