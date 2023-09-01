import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/constant_width.dart';
import '../../view_model/account_view_model/account_view_model.dart';
import '../../view_model/language_view_model/language_view_model.dart';
import '../../widgets/global_widgets/custom_devider.dart';
import '../../widgets/global_widgets/filter_app_bar.dart';
import '../account_screens/setting_widgets/commercial_seller_card.dart';
import '../account_screens/setting_widgets/setting_widgets.dart';
import 'account_screen_widgets/custom_dialouge.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
      body: Consumer<AccountViewModel>(builder: (context, controller, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //card and user design
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ConstantSize.getWidth(context) * 0.06,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 24,
                    ),
                    //My Account Text
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'My Account',
                        style: MyTextStyles.medium20Black,
                      ),
                    ),
                    //spacer
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 35,
                    ),
                    //profile
                    const ProfileScreen(),
                    //spacer
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 29,
                    ),
                    //devider
                    const CustomDivider(
                      indent: 0.0,
                      endIndent: 0.0,
                      color: AppColors.deviderColor,
                    ),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 32,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ScreenRoutes.commercialScreen1);
                        },
                        child: const CommercialSellerCard())
                  ],
                ),
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 33,
              ),
              //account settings
              Container(
                padding: EdgeInsets.only(
                    left: ConstantSize.getScaleWidth(context) * 24),
                alignment: Alignment.centerLeft,
                height: ConstantSize.getScaleHeight(context) * 48,
                width: double.infinity,
                color: AppColors.skyLiteBlue,
                child: Text(
                  'Account Settings',
                  style: MyTextStyles.medium18black,
                ),
              ),
              // account with icons

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ConstantSize.getWidth(context) * 0.06,
                ),
                child: SizedBox(
                  height: 500,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.accountItems.length,
                      itemBuilder: (context, index) {
                        final languageProvider =
                            Provider.of<LanguageViewModel>(context);
                        final selectedLocale = languageProvider.selectedLocale;
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  controller.accountItems[index].route);
                            },
                            child: Container(
                              height: 80.0,
                              padding: const EdgeInsets.all(16.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.deviderColor)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    controller.accountItems[index].iconPath,
                                    width: 30.0, // Adjust the size as needed
                                    height: 30.0,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                      child: Text(
                                    controller.accountItems[index].text,
                                    style: MyTextStyles.medium16Black,
                                  )),
                                  controller.accountItems[index].text ==
                                          "Language"
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            selectedLocale.languageCode == "en"
                                                ? "English"
                                                : selectedLocale.languageCode ==
                                                        "de"
                                                    ? "German"
                                                    : selectedLocale
                                                                .languageCode ==
                                                            "it"
                                                        ? "Itly"
                                                        : "France",
                                            style:
                                                MyTextStyles.regular14Primary,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  Icon(controller.accountItems[index].icon),
                                ],
                              ),
                            ));
                      }),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: ConstantSize.getScaleWidth(context) * 24),
                alignment: Alignment.centerLeft,
                height: ConstantSize.getScaleHeight(context) * 48,
                width: double.infinity,
                color: AppColors.skyLiteBlue,
                child: Text(
                  'General',
                  style: MyTextStyles.medium18black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ConstantSize.getWidth(context) * 0.06,
                ),
                child: SizedBox(
                  height: 330,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.generalItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              controller.generalItems[index].route ==
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
                                  : Navigator.pushNamed(context,
                                      controller.generalItems[index].route);
                            },
                            child: Container(
                              height: 80.0,
                              padding: const EdgeInsets.all(16.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.deviderColor)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    controller.generalItems[index].iconPath,
                                    width: 30.0, // Adjust the size as needed
                                    height: 30.0,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                      child: Text(
                                    controller.generalItems[index].text,
                                    style: MyTextStyles.medium16Black,
                                  )),
                                  Icon(controller.generalItems[index].icon),
                                ],
                              ),
                            ));
                      }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
