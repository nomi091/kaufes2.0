import 'package:flutter/material.dart';

import '../../utils/constants/button_progress_indecator.dart';

class BtnPrimeryBackground extends StatelessWidget {
  BtnPrimeryBackground({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.borderRadiusCircular,
    required this.borderSideWidth,
    required this.textStyle,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.borderColor,
    this.isLoading = false, // Default value is set to false, i.e., not loading.
  }) : super(key: key);

  double width;
  double height, borderRadiusCircular, borderSideWidth;
  Color backgroundColor;
  Color borderColor;
  String title;
  TextStyle textStyle;
  final VoidCallback onPressed;
  bool isLoading; // New parameter to indicate loading status

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // Disable button if loading is true
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        side: BorderSide(
          color: borderColor,
          width: borderSideWidth,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusCircular),
        ),
        backgroundColor: backgroundColor,
      ),
      child: isLoading
          ? const CustomButtonProgressIndicator(
            size: 30,
          )
          : Text( // Show the title if isLoading is false
              title,
              style: textStyle,
            ),
    );
  }
}
