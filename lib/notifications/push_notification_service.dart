import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/rendering.dart';

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
}
