import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/image_paths.dart';

import '../../../utils/constants/strings.dart';

class SellProductBanner extends StatelessWidget {
  const SellProductBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 2,
      child: Column(
        children: [
          Image.asset(AppImages.homePageMainBanner),
          Container(
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: AppPadding.wDefaultPadding / 2.5,
                  ),
                  Text(
                    MyStrings.sellProducts,
                    style: MyTextStyles.headingSmallWhite,
                  ),
                  const SizedBox(
                    height: AppPadding.wDefaultPadding / 1.5,
                  ),
                  const Text(
                    MyStrings.dummyText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(
                    height: AppPadding.wDefaultPadding / 1.5,
                  ),
                  SizedBox(
                
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text(
                        MyStrings.placeAd,
                        style: MyTextStyles.headingSmallPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppPadding.wDefaultPadding / 1.5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
