import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('Notification Title: ${message.notification?.title}');
  log('Notification Body: ${message.notification?.body}');
  log('Notification Payload: ${message.data}');
}

class FirebaseApi {
  static String fcmToken = "";
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    fcmToken = await _firebaseMessaging.getToken() ?? 'Error';
    log('fCMToken :$fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
