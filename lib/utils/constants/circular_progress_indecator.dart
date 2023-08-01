import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaufes/utils/constants/colors.dart';


class CustomCicularProgressIndecator extends StatelessWidget {
  const CustomCicularProgressIndecator({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
        color:Colors.transparent,
        child: const Center(
          child: SpinKitSpinningLines(
              size:50, color: AppColors.secondaryColor
          ),
        )
    );
  }
}
