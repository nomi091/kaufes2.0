import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

import '../../widgets/auth_widgets/onboarding_screen.dart';
import '../../widgets/global_widgets/primary_button.dart';
import '../../utils/constants/constant_width.dart';
import '../../utils/constants/image_paths.dart';
import '../../utils/routes/routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AppImages.welcomeBgScreen,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: ConstantSize.getHeight(context) * 0.08,
                    ),
                    child: Image.asset(
                      //width:200,
                      AppImages.accounTypeLogo,
                      height: 50,
                      
                    ),
                  ),
                  SizedBox(height: ConstantSize.getHeight(context) * 0.025),
                  OnboardingScreenData(
                    image: AppImages.dealIcon,
                    title: 'find_best_deals'.tr(),
                    subTitle: 'dummy_text'.tr(),
                  ),
                  SizedBox(height: ConstantSize.getHeight(context) * 0.025),
                  OnboardingScreenData(
                    image: AppImages.sellStuffIcon,
                    title: 'sell_stuff'.tr(),
                    subTitle: 'dummy_text'.tr(),
                  ),
                  SizedBox(height: ConstantSize.getHeight(context) * 0.025),
                  OnboardingScreenData(
                    image: AppImages.trustedIcon,
                    title: "trusted_platform".tr(),
                    subTitle: 'dummy_text'.tr(),
                  ),
                  SizedBox(height: ConstantSize.getHeight(context) * 0.045),
                  BtnPrimeryBackground(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ScreenRoutes.logIn,
                      );
                    },
                    title:'login'.tr(),
                    borderRadiusCircular: 4,
                    borderSideWidth: 0.1,
                    textStyle: const TextStyle(
                        fontSize: 16, color: AppColors.whiteColor),
                    width: ConstantSize.getWidth(context) * 0.9,
                    height: ConstantSize.getHeight(context) * 0.05,
                    backgroundColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: ConstantSize.getHeight(context) * 0.02),
                  BtnPrimeryBackground(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ScreenRoutes.signUp,
                      );
                    },
                    title: 'signUP'.tr(),
                    borderRadiusCircular: 4,
                    borderSideWidth: 0.1,
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                    width: ConstantSize.getWidth(context) * 0.9,
                    height: ConstantSize.getHeight(context) * 0.05,
                    backgroundColor: AppColors.secondaryColor,
                    borderColor: AppColors.secondaryColor,
                  ),
                  SizedBox(height: ConstantSize.getHeight(context) * 0.035),
                  InkWell(
                    onTap: () {
                   Navigator.pushNamed(
                        context,
                        ScreenRoutes.bottomNavBar,
                      );
                    },
                    child: Text(
                      "skip".tr(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                   Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.36),
                    child: Text(
                      'terms_conditions'.tr(),
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 14, color: AppColors.blackColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
