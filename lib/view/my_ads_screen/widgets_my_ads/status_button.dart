import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  const StatusButton({super.key, 
    required this.title,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ConstantSize.getWidth(context) * 0.005,
      height: ConstantSize.getHeight(context) * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return isActive ? AppColors.primaryColor : Colors.white;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              return BorderSide(
                color: isActive ? AppColors.primaryColor : AppColors.grayColor,
                width: 1,
              );
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : AppColors.blackColor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
