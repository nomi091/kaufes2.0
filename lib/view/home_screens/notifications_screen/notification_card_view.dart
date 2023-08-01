import 'package:flutter/material.dart';
import 'package:kaufes/view/home_screens/notifications_screen/notfications.dart';

import '../../../utils/constants/colors.dart';

class NoficationCardScreen extends StatelessWidget {
  const NoficationCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Your Ads is Live Now',
            style: MyTextStyles.detailCardNormalBlack,
          ),
          subtitle: Text(
            'Add approved at ${formatDateAndExtractTime(DateTime.now()).toString()}',
          ),
        ),
        const Divider(
          color: AppColors.liteGrayColor,
          thickness: 1.0,
        ),
      ],
    );
  }
}
