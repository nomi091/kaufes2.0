
import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseFunctions {
  static final fcmToken = FirebaseMessaging.instance;
  static Future<String?> getToken() async {
    return await fcmToken.getToken();
  }

  static Future<void> requestPermission() async {
    FirebaseMessaging.instance.requestPermission();
    await fcmToken.requestPermission();
  }}