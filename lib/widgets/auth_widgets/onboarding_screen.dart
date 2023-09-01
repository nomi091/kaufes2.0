import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';

class OnboardingScreenData extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingScreenData({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          height: 65,
        ),
        SizedBox(width: ConstantSize.getWidth(context) * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.blackColor),
              ),
              SizedBox(height: ConstantSize.getHeight(context) * 0.02),
              Text(
                subTitle,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16, color:AppColors.grayColor),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
