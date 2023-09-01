import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/account_view_model/account_view_model.dart';
import '../../../view_model/notification_view_model/notification_view_model.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      body: Consumer<NotificationViewModel>(builder: (context, controller, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ConstantSize.getWidth(context) * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 24,
              ),
              Text(
                'Notifications Settings',
                style: MyTextStyles.medium20Black,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 8,
              ),
              Text(
                'Manage your Notifications',
                style: MyTextStyles.regular14gray,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 10,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.notificationsItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,
                              controller.notificationsItems[index].route,
                              arguments: {
                                'title':
                                    controller.notificationsItems[index].text
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: AppColors.deviderColor)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                controller.notificationsItems[index].iconPath,
                                width: 40.0, // Adjust the size as needed
                                height: 40.0,
                              ),
                              SizedBox(
                                  width:
                                      ConstantSize.getScaleWidth(context) * 10),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    top: ConstantSize.getScaleHeight(context) *
                                        18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.notificationsItems[index].text,
                                      style: MyTextStyles.medium16Black,
                                    ).tr(),
                                    SizedBox(
                                        height: ConstantSize.getScaleHeight(
                                                context) *
                                            6),
                                    Text(
                                      controller
                                          .notificationsItems[index].text2,
                                      style: MyTextStyles.regular12gray,
                                    ).tr(),
                                  ],
                                ),
                              )),
                              Icon(
                                controller.notificationsItems[index].icon,
                                size: 24,
                                color: AppColors.grayColor,
                              ),
                            ],
                          ),
                        ));
                  }),
              SizedBox(height: ConstantSize.getScaleHeight(context) * 116),
            ],
          ),
        );
      }),
    );
  }
}
