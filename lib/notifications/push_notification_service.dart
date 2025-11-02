import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notifications/notifications/local_notification_service.dart';

class PushNotificationService {
  static final firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }

    String? fcmToken = await firebaseMessaging.getToken();

    debugPrint('FCM Token: $fcmToken');
  }

  static Future<void> onBackgroundMessage(RemoteMessage message) async {
    debugPrint(message.notification?.title);
    if (message.notification != null) {
      debugPrint("Background Message ${message.notification!.title}");
    }
  }

  static Future<void> onBackgroundNotificationTapped(
    RemoteMessage message,
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    navigatorKey.currentState?.pushNamed("/data-viewer", arguments: message);
  }

  static Future<void> onForeroundNotificationTapped(
    RemoteMessage message,
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    //String payloadData = jsonEncode(message.data);

    print("Got the message in foreground");

    if (message.notification != null) {
      await LocalNotificationService.showInstanceNotifications(
        title: message.notification!.title!,
        body: message.notification!.body!,
        //payload: payloadData,
      );




      //this will automatically display the payload page
      // await navigatorKey.currentState!
      //     .pushNamed('/message', arguments: message);
    }
  }
}
