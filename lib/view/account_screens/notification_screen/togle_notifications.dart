import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/notification_view_model/notification_view_model.dart';
import '../../../widgets/global_widgets/custom_devider.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';

// ignore: must_be_immutable
class TogleNotficationsScreen extends StatefulWidget {
  var title;
  TogleNotficationsScreen({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _TogleNotficationsScreenState createState() =>
      _TogleNotficationsScreenState();
}

class _TogleNotficationsScreenState extends State<TogleNotficationsScreen> {
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
      body: Consumer<NotificationViewModel>(
          builder: (context, controller, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ConstantSize.getWidth(context) * 0.06,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 24,
                    ),
                    Text(
                      '${widget.title}',
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
                  ],
                ),
              ),
              Container(
                color: AppColors.skyLiteBlue,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ConstantSize.getWidth(context) * 0.06,
                  ),
                  child: ListTile(
                    title: Text(
                      'Allow All',
                      style: MyTextStyles.medium16Primary,
                    ),
                    trailing: Transform.scale(
                      scale: 1.3,
                      child: Switch(
                        value: controller.mainToggle,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            controller.mainToggle = value;
                            for (int i = 0;
                                i < controller.buyingNotifications.length;
                                i++) {
                              controller.buyingNotifications[i].toggle = value;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ...List.generate(controller.buyingNotifications.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ConstantSize.getWidth(context) * 0.06,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 13,
                      ),
                      ListTile(
                        title: Text(
                          controller.buyingNotifications[index].text,
                          style: MyTextStyles.medium14Black,
                        ),
                        trailing: Transform.scale(
                          scale: 1.3,
                          child: Switch(
                            value: controller.buyingNotifications[index].toggle,
                            activeColor: AppColors.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                controller.buyingNotifications[index].toggle =
                                    value;

                                // Check if all toggles are on or off to adjust mainToggle accordingly
                                if (controller.buyingNotifications.every(
                                    (element) => element.toggle == false)) {
                                  controller.mainToggle = false;
                                } else if (controller.buyingNotifications.every(
                                    (element) => element.toggle == true)) {
                                  controller.mainToggle = true;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 13,
                      ),
                      const CustomDivider(),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
