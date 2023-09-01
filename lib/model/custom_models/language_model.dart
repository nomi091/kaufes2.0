import 'package:flutter/material.dart';

class LanguageInfoModel {
  String name;
  String flag;
  bool isSelected;
  Locale locale;

  LanguageInfoModel(
      {required this.name,
      this.isSelected = false,
      required this.flag,
      required this.locale});
}
