import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double indent;
  final double endIndent;
  final Color? color;

  const CustomDivider({
    super.key,
    this.height = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
      color: color ?? AppColors.deviderColor,
    );
  }
}
