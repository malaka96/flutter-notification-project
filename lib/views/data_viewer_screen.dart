import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class DataViewerScreen extends StatefulWidget {
  const DataViewerScreen({super.key});

  @override
  State<DataViewerScreen> createState() => _DataViewerScreenState();
}

class _DataViewerScreenState extends State<DataViewerScreen> {
  Map<String, dynamic> payload = {};

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;

    if (data is RemoteMessage) {
      payload = data.data;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Data Viewer Screen')),
      body: Column(children: [Text(payload.toString())]),
    );
  }
}
