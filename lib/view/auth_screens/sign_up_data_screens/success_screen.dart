import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/routes/routes.dart';

import '../../../utils/constants/constant_width.dart';
import '../auth_widget/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: FilterAppBar(
      //   onTapTrailing: () {},
      //   height: ConstantSize.getHeight(context) * 0.05,
      //   title: '',
      //   subTitle: '',
      //   trailingCheck: false,
      // ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: ConstantSize.getHeight(context) * 0.05,
            horizontal: ConstantSize.getWidth(context) * 0.06,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 100,
                color: AppColors.secondaryColor,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Kaufes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'dummy_text',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ).tr(),
              const SizedBox(height: 40),
              buildCustomButton(
                  buttonPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, ScreenRoutes.bottomNavBar, (route) => false);
                  },
                  title: 'Home Page',
                  context: context,
                  isLoading: false)
            ],
          ),
        ),
      ),
    );
  }
}
