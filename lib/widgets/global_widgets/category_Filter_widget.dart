import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CategoryFilterWidget extends StatelessWidget {
  final String title;
  final bool hasIcon;
  final Widget child;
  final bool hasDivider;

  const CategoryFilterWidget({
    Key? key,
    required this.title,
    required this.hasIcon,
    required this.child,
    required this.hasDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: MyTextStyles.subHeadingBoldBlack),
            if (hasIcon)
              const Icon(Icons.navigate_next_sharp,
                  color: AppColors.dimGray, size: 30),
          ],
        ),
        const SizedBox(
          height: AppPadding.wDefaultPadding / 2,
        ),
        child,
        if (hasDivider) const Divider(color: AppColors.blackColor, height: 10),
      ],
    );
  }
}
