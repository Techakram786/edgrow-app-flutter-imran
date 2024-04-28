
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'GoSpecificScreen.dart';
import 'PayLoadModel/NavigationDetails.dart';

mixin FlutterLocalNotification {
  static void initLocalNotification(
      BuildContext context, NavigationDetailsModel navigationDetailsModel) async {
    FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payloads) {
        goSpecificScreen(context:context, navigationDetailsModel: navigationDetailsModel);
      },
    );
  }
}
