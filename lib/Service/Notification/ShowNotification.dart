import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

mixin ShowNotification {
  static show(RemoteMessage message) {
    FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000000).toString(),
        importance: Importance.max  ,
        showBadge: true ,
        'High Importance Notification' );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'Your Channel Description',
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker');

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);


    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(
      Duration.zero,
      () {
        if (message.notification != null) {
          notificationsPlugin.show(
              0,
              message.notification?.title,
              message.notification?.body,
              notificationDetails);
        }
      },
    );
  }
}
