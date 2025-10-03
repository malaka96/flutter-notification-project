import 'package:flutter/material.dart';
import 'package:flutter_notifications/notifications/local_notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
              onPressed: () {
                DateTime duration = DateTime.now().add(
                  const Duration(seconds: 5),
                );
                LocalNotificationService.showScheduledNotifications(
                  title: "scheduled Notification",
                  body: "you have been selected to ASE",
                  scheduledData: duration,
                );
              },
              child: Text('Generate a scheduled notification'),
            ),

            ElevatedButton(
              onPressed: () {
                LocalNotificationService.showRecuringNotification(
                  title: "Recuring Notifcation",
                  body: "You have been promoted to SE",
                  hour: 11,
                  minute: 19,
                );
              },
              child: Text('Generate recuring notifications'),
            ),

            ElevatedButton(
              onPressed: () {
                LocalNotificationService.showBigPictureNotification(
                  title: "Bigpicture Notification",
                  body: "You have been promoted to SSE",
                  imageUrl: "@mipmap/ic_launcher",
                );
              },
              child: Text('Generate a bigpicture notification'),
            ),
          ],
        ),
      ),
    );
  }
}
