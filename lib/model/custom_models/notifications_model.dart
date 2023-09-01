import 'package:flutter/material.dart';

class NotificationsItemsModel {
  final String iconPath;
  final String text;
  final String text2;
  final String route;
  final IconData icon;

  NotificationsItemsModel(
      {required this.iconPath,
      required this.text,
      required this.text2,
      required this.route,
      required this.icon});
}

class ToggleNotificationItemsModel {
   String text;
   bool toggle;
  ToggleNotificationItemsModel({
    required this.text,
    required this.toggle,
  });
}
