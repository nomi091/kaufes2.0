import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../utils/routes/routes.dart';
import '../../../view_model/general_items_view_model/general_view_model.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../account_screen_widgets/custom_dialouge.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
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
      body: Consumer<GeneralViewModel>(builder: (context, controller, child) {
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
                'Help & Support',
                style: MyTextStyles.medium20Black,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 8,
              ),
              Text(
                'How can we help you?',
                style: MyTextStyles.regular14gray,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 10,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.helpSupportItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          controller.helpSupportItems[index].route ==
                                  ScreenRoutes.customDialougeScreen
                              ? Navigator.of(context).push(
                                  PageRouteBuilder(
                                    opaque:
                                        false, // this makes the route transparent
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            const CustomDialougeScreen(),
                                  ),
                                )
                              : Navigator.pushNamed(
                                  context,
                                  controller.helpSupportItems[index].route,
                                );
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
                                controller.helpSupportItems[index].iconPath,
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
                                      controller.helpSupportItems[index].text,
                                      style: MyTextStyles.medium16Black,
                                    ).tr(),
                                    SizedBox(
                                        height: ConstantSize.getScaleHeight(
                                                context) *
                                            6),
                                    Text(
                                      controller.helpSupportItems[index].text2,
                                      style: MyTextStyles.regular12gray,
                                    ).tr(),
                                  ],
                                ),
                              )),
                              Icon(
                                controller.helpSupportItems[index].icon,
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
