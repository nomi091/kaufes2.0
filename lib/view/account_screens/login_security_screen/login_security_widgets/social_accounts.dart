import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/utils/constants/constant_width.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_paths.dart';
import '../../../../widgets/global_widgets/custom_devider.dart';

class SocialAccounts extends StatefulWidget {
  const SocialAccounts({super.key});

  @override
  State<SocialAccounts> createState() => _SocialAccountsState();
}

class _SocialAccountsState extends State<SocialAccounts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connected accounts',
          style: MyTextStyles.medium18Black,
        ),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 32,
        ),
        buildSocialIcons(
            image: AppImages.facebookIcon,
            text1: "Facebook",
            text2: 'connected',
            text3: "Connect",
            //    controller: controller,
            ontap: () {}),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 12,
        ),
        const CustomDivider(
          indent: 0.0,
          endIndent: 0.0,
          color: AppColors.deviderColor,
        ),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 12,
        ),
        buildSocialIcons(
            image: AppImages.googleIcon,
            text1: "Facebook",
            text2: 'connected',
            text3: "Disconnect",
            ontap: () {}),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 12,
        ),
        const CustomDivider(
          indent: 0.0,
          endIndent: 0.0,
          color: AppColors.deviderColor,
        ),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 12,
        ),
        buildSocialIcons(
            image: AppImages.appleIcon,
            text1: "Facebook",
            text2: 'connected',
            text3: "Disconnect",
            ontap: () {}),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 32,
        ),
        const CustomDivider(
          indent: 0.0,
          endIndent: 0.0,
          color: AppColors.deviderColor,
        ),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Deactivate Account', style: MyTextStyles.medium16Black),
            Text('Deactivate', style: MyTextStyles.medium14Red),
          ],
        ),
        SizedBox(
          height: ConstantSize.getScaleHeight(context) * 11,
        ),
        Text('dummy_text'.tr(), style: MyTextStyles.regular12gray),
      ],
    );
  }

  Widget buildSocialIcons({image, text1, text2, text3, ontap, }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: ConstantSize.getScaleWidth(context) * 16,
            ),
            Column(
              children: [
                Text(
                  '$text1',
                  style: MyTextStyles.medium16Black,
                ),
                Text('$text2', style: MyTextStyles.regular14gray),
              ],
            ),
          ],
        ),
        InkWell(
            onTap: ontap,
            child: Text(
              text3,
              style: MyTextStyles.medium14Black,
            )),
      ],
    );
  }
}
