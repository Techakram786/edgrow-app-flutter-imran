// // ignore_for_file: use_build_context_synchronously
//
// import 'dart:io';
// import 'dart:math';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'GoSpecificScreen.dart';
// import 'PayLoadModel/NavigationDetails.dart';
//
// class NotificationServices {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true);
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint('user granted Permission is Authorized');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       debugPrint('user granted Permission is Provisional');
//     } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
//       debugPrint('user granted Permission is Denied');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.notDetermined) {
//       debugPrint('user granted Permission is Not Determined');
//     }
//   }
//
//   getDeviceToken() async {
//     String? deviceToken = await messaging.getToken();
//     debugPrint('Notification Device Token');
//     debugPrint('Token :- $deviceToken');
//     return deviceToken ?? '';
//   }
//
//   deviceTokenRefresh() {
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//       debugPrint(event.toString());
//     });
//   }
//
//   void setupInteractMessage(BuildContext context) async {
//     RemoteMessage? payloads =
//         await FirebaseMessaging.instance.getInitialMessage();
//
//     if (payloads != null) {
//       final navigationDetailsModel =
//           NavigationDetailsModel.fromJson(payloads.data);
//
//       goSpecificScreen(
//           context: context, navigationDetailsModel: navigationDetailsModel);
//
//       // This Method is When Run Then App is BackGround
//       FirebaseMessaging.onMessageOpenedApp.listen((event) {
//         goSpecificScreen(
//             context: context, navigationDetailsModel: navigationDetailsModel);
//       });
//     }
//   }
//
//   flutterLocalNotification(RemoteMessage message) {
//     FlutterLocalNotificationsPlugin notificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         Random.secure().nextInt(100000000).toString(),
//         importance: Importance.max,
//         showBadge: true,
//         'High Importance Notification');
//
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//             channel.id.toString(), channel.name.toString(),
//             channelDescription: "Your Channel Description",
//             importance: Importance.high,
//             priority: Priority.high,
//             ticker: 'ticker');
//
//     DarwinNotificationDetails darwinNotificationDetails =
//         const DarwinNotificationDetails(
//             presentAlert: true, presentBadge: true, presentSound: true);
//
//     NotificationDetails notificationDetails = NotificationDetails(
//         android: androidNotificationDetails, iOS: darwinNotificationDetails);
//
//     Future.delayed(
//       Duration.zero,
//       () {
//         if (message.notification != null) {
//           notificationsPlugin.show(0, message.notification?.title,
//               message.notification?.body, notificationDetails);
//         }
//       },
//     );
//   }
//
//   Future<void> firebaseInit(BuildContext context) async {
//     debugPrint('** Firebase Initialization **');
//     await Firebase.initializeApp();
//     FirebaseMessaging.onMessage.listen((payloads) async {
//       debugPrint('Notification Type is :->${payloads.data["type"]}');
//
//       debugPrint('* Payloads *');
//       debugPrint(payloads.toMap().toString());
//       debugPrint('* Title *');
//       debugPrint('${payloads.notification?.title}');
//       debugPrint('* Body *');
//       debugPrint('${payloads.notification?.body}');
//       debugPrint('* Data *');
//       debugPrint('${payloads.data}');
//       RemoteNotification? notification = payloads.notification;
//       AndroidNotification? android = payloads.notification?.android;
//       if (android != null && notification != null) {
//         if (Platform.isAndroid) {
//           final navigationDetailsModel =
//               NavigationDetailsModel.fromJson(payloads.data);
//           initLocalNotification(context, navigationDetailsModel);
//           flutterLocalNotification(payloads);
//         }
//         if (Platform.isIOS) {
//           await FirebaseMessaging.instance
//               .setForegroundNotificationPresentationOptions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//         }
//       }
//     });
//   }
//
//   void initLocalNotification(BuildContext context,
//       NavigationDetailsModel navigationDetailsModel) async {
//     FlutterLocalNotificationsPlugin notificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//     var androidInitializationSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();
//     var initializationSettings = InitializationSettings(
//         android: androidInitializationSettings, iOS: iosInitializationSettings);
//     notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (payloads) {
//         goSpecificScreen(
//             context: context, navigationDetailsModel: navigationDetailsModel);
//       },
//     );
//   }
// }
