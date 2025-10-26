import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notifications/firebase_options.dart';
import 'package:flutter_notifications/notifications/local_notification_service.dart';
import 'package:flutter_notifications/notifications/push_notification_service.dart';
import 'package:flutter_notifications/views/data_viewer_screen.dart';
import 'package:flutter_notifications/views/home_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  tz.initializeTimeZones();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await PushNotificationService.init();

  FirebaseMessaging.onBackgroundMessage(
    PushNotificationService.onBackgroundMessage,
  );

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    if (message.notification != null) {
      debugPrint("notification was tapped");
      await PushNotificationService.onBackgroundNotificationTapped(
        message,
        navigatorKey,
      );
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {
        "/": (context) => HomeScreen(),
        "/data-viewer": (context) => DataViewerScreen(),
      },
    );
  }
}
