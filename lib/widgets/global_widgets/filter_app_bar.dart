import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

class FilterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FilterAppBar({
    Key? key,
    required this.height,
    required this.title,
    this.subTitle,
    required this.trailingCheck,
    required this.onTapBack,
    this.icon,
    this.onTapTrailing,
  }) : super(key: key);

  final double height;
  final String title;
  final String? subTitle;
  final bool trailingCheck;
  final Icon? icon;
  final VoidCallback? onTapTrailing;
  final VoidCallback? onTapBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.grayColor),
        onPressed: onTapBack,
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: MyTextStyles.appBarMedium)),
      actions: [
        if (trailingCheck)
          GestureDetector(
            onTap: onTapTrailing,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  subTitle!,
                  style: MyTextStyles.appBarMedium,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
