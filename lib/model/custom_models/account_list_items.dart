import 'package:flutter/material.dart';

class ContainerItem {
  final String iconPath;
  final String text;
  final String route;
  final IconData icon;

  ContainerItem(
      {required this.iconPath,
      required this.text,
      required this.route,
      required this.icon});
}
