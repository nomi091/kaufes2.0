import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/constants/image_paths.dart';

import '../../../utils/constants/colors.dart';
import '../../../widgets/global_widgets/primary_button.dart';

class CustomDialougeScreen extends StatelessWidget {
  const CustomDialougeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ConstantSize.getWidth(context) * 0.06,
        ),
        child: SizedBox(
          width: ConstantSize.getScaleWidth(context) * 326, // 300px
          height: ConstantSize.getScaleHeight(context) * 324, // 300px
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 22,
              ),
              SvgPicture.asset(
                AppImages.webLinkIcon,
                width: 64.0, // Adjust the size as needed
                height: 64.0,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 24,
              ),
               Text('Are you sure open the link in your web browser',style: MyTextStyles.medium16Black,textAlign: TextAlign.center,),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 24,
              ),
              BtnPrimeryBackground(
                onPressed: () {},
                title: 'Open Link'.tr(),
                isLoading: false,
                borderRadiusCircular: 8,
                borderSideWidth: 0.1,
                textStyle: MyTextStyles.medium16white,
                width: ConstantSize.getWidth(context) * 1,
                height: ConstantSize.getScaleHeight(context) * 48.0,
                backgroundColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 14,
              ),
              BtnPrimeryBackground(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: 'Cancel'.tr(),
                isLoading: false,
                borderRadiusCircular: 8,
                borderSideWidth: 0.1,
                textStyle: MyTextStyles.medium16Black,
                width: ConstantSize.getWidth(context) * 1,
                height: ConstantSize.getScaleHeight(context) * 48.0,
                backgroundColor: AppColors.whiteColor,
                borderColor: AppColors.grayColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
