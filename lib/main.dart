import 'package:flutter/material.dart';
import 'package:flutter_notifications/notifications/local_notification_service.dart';
import 'package:flutter_notifications/views/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {"/": (context) => HomeScreen()},
    );
  }
}
