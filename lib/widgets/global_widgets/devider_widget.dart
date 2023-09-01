import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

Widget customDevider({height,indent,endindent}) {
  return  Divider(
    color: AppColors.grayColor, // Customize the color of the divider
    height: height, // Customize the height of the divider
    thickness: 0.4, // Customize the thickness of the divider
    indent: indent, // Customize the indent (left padding) of the divider
    endIndent: endindent, // Customize the end indent (right padding) of the divider
  );
}
Widget customVerticalDevider({indent,endindent}) {
  return  VerticalDivider(
    color: AppColors.primaryColor, // Customize the color of the divider
    thickness: 0.4, // Customize the thickness of the divider
    indent: indent, // Customize the indent (left padding) of the divider
    endIndent: endindent, // Customize the end indent (right padding) of the divider
  );
}
