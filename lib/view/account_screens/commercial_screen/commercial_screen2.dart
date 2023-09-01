import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../utils/routes/routes.dart';
import '../../../view_model/account_view_model/account_view_model.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../widgets/global_widgets/primary_button.dart';

class CommercialScreen1 extends StatefulWidget {
  const CommercialScreen1({super.key});

  @override
  State<CommercialScreen1> createState() => _CommercialScreen1State();
}

class _CommercialScreen1State extends State<CommercialScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterAppBar(
        onTapTrailing: () {},
        onTapBack: () {
          Navigator.pop(context);
        },
        height: ConstantSize.getHeight(context) * 0.05,
        title: 'Back'.tr(),
        subTitle: '',
        trailingCheck: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ConstantSize.getWidth(context) * 0.06,
        ),
        child:
            Consumer<AccountViewModel>(builder: (context, controller, child) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ConstantSize.getScaleHeight(context) * 24),
                Text(
                  'Upgrade to',
                  style: MyTextStyles.medium21Primary,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                Text(
                  'Commercial User',
                  style: MyTextStyles.medium21Secondary,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                Text(
                  'dummy_text'.tr(),
                  style: MyTextStyles.regular17Black,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                SizedBox(
                  height: ConstantSize.getScaleHeight(context) * 230,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.commecialPoints.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  ConstantSize.getScaleHeight(context) * 12),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.done,
                                color: AppColors.secondaryColor,
                                size: 30,
                              ),
                              const SizedBox(width: 11.0),
                              Text(
                                controller.commecialPoints[index].text,
                                style: MyTextStyles.medium17Primary,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Text(
                  'dummy_text'.tr(),
                  style: MyTextStyles.medium15gray,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                BtnPrimeryBackground(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ScreenRoutes.commercialScreen2);
                  },
                  title: 'Continue'.tr(),
                  // isLoading: controller.authloading,
                  borderRadiusCircular: 8,
                  borderSideWidth: 0.1,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                  width: double.infinity,
                  height: ConstantSize.getScaleHeight(context) * 48.0,
                  backgroundColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 24),
                BtnPrimeryBackground(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'Back'.tr(),
                  borderRadiusCircular: 8,
                  borderSideWidth: 0.1,
                  textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                  width: double.infinity,
                  height: ConstantSize.getScaleHeight(context) * 48.0,
                  backgroundColor: AppColors.whiteColor,
                  borderColor: AppColors.grayColor,
                ),
              ]);
        }),
      ),
    );
  }
}
