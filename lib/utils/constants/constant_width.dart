import 'package:flutter/cupertino.dart';

class ConstantSize {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScaleHeight(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }

  static double getScaleWidth(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }
}
