import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:kaufes/utils/routes/routes.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCustomAppBar({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(AppImages.svgLogo),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ScreenRoutes.notificationsScreen);
                  },
                  child: SvgPicture.asset(AppImages.svgAlert)),
              const SizedBox(
                width: 11,
              ),
              InkWell(
                  onTap: () {
              Navigator.pushNamed(context, ScreenRoutes.favouriteScreen);
                 },
                  child: const Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColors.primaryColor,
                  )),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
