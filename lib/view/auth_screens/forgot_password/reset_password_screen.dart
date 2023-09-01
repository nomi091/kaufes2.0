
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/routes/routes.dart';

import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../widgets/global_widgets/primary_button.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
          child: FilterAppBar(
            height: ConstantSize.getHeight(context) * 0.05,
            title: "Reset Passsoword",
            trailingCheck: false,
            onTapBack: () {
              Navigator.pop(context);
            },
            onTapTrailing: () {
              //    Get.offAndToNamed(MyRoutes.getHomeScreen());
            },
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.email,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'We have sent you an email to update your password.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ConstantSize.getWidth(context)*0.2),
              child: BtnPrimeryBackground(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.logIn, (route) => false);
                },
                title: 'login'.tr(),
                isLoading: false,
                borderRadiusCircular: 4,
                borderSideWidth: 0.1,
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
                width: double.infinity,
                height: ConstantSize.getHeight(context) * 0.05,
                backgroundColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
