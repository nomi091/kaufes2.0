import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:kaufes/utils/constants/strings.dart';

class CommercialSellerCard extends StatelessWidget {
  const CommercialSellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3), // Changes the position of the shadow
          ),
        ],
      ),
      height: ConstantSize.getScaleHeight(context) * 120,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              //color: Colors.amber,
              width: ConstantSize.getScaleWidth(context)*243,
              height: ConstantSize.getScaleHeight(context)*85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Become a commercial seller',
                    style: MyTextStyles.medium14primary
                  ),
                  const SizedBox(height: 4.0),
                   Text(
                    MyStrings.dummyText,
                    maxLines: 3,
                    style: MyTextStyles.regular13gray
                  ),
                ],
              ),
            ),
            Center(
              child: SvgPicture.asset(
                AppImages.commercialIcon,
                width: ConstantSize.getScaleWidth(context)*46.44,
                height: ConstantSize.getScaleHeight(context)*44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
