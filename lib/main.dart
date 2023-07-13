import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase In-App Messaging',
      home: FirebaseInAppMessagingExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirebaseInAppMessagingExample extends StatefulWidget {
  @override
  _FirebaseInAppMessagingExampleState createState() =>
      _FirebaseInAppMessagingExampleState();
}

class _FirebaseInAppMessagingExampleState
    extends State<FirebaseInAppMessagingExample> {
  @override
  void initState() {
    super.initState();
    _getInstanceId();
  }

  void _getInstanceId() async {
    await Firebase.initializeApp();
    var token = await FirebaseMessaging.instance.getToken();
    print("Instance ID: " + token!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase In-App Messaging'),
        centerTitle: true,
      ),
    );
  }
}
