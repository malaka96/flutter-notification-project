import 'package:flutter/material.dart';
import 'package:flutter_notifications/notifications/local_notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              LocalNotificationService.showInstanceNotifications(
                title: "Job Alert",
                body: "Mobile Application Developer",
              );
            },
            child: Text('Generate a Notification'),
          ),
        ],
      ),
    );
  }
}
