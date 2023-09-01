import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/image_paths.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../widgets/global_widgets/circular_avatar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CireleAvatarImage(
        image: AppImages.placeHolder, // Replace with your asset image path
        border: 30.0, // Provide the desired border radius
      ),
      SizedBox(width: ConstantSize.getScaleWidth(context) * 21.25),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ahmad Rahal',
            style: MyTextStyles.semiBo1d6Primary,
          ),
          Text(
            'Private User',
            style: MyTextStyles.medium14gray,
          ),
        ],
      ),
      SizedBox(width: ConstantSize.getScaleWidth(context) * 120),
      const Icon(Icons.arrow_forward_ios_outlined)
    ]);
  }
}
