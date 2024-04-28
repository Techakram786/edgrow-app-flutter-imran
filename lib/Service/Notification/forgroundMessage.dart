import 'package:firebase_messaging/firebase_messaging.dart';

mixin ForegroundMessage{

static Future foregroundMessages() async {
  await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}}