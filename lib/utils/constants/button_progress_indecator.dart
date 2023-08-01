import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

class CustomButtonProgressIndicator extends StatelessWidget {
  final double size;
  final Color color;

  const CustomButtonProgressIndicator({super.key, this.size = 50.0, this.color = AppColors.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
