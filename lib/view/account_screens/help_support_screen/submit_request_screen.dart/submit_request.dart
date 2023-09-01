import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/custom_models/country_info_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/constant_width.dart';
import '../../../../view_model/general_items_view_model/general_view_model.dart';
import '../../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../../widgets/global_widgets/primary_button.dart';
import '../../login_security_screen/login_security_widgets/custom_text_field.dart';

class SubmitRequestScreen extends StatefulWidget {
  const SubmitRequestScreen({super.key});

  @override
  State<SubmitRequestScreen> createState() => _SubmitRequestScreenState();
}

class _SubmitRequestScreenState extends State<SubmitRequestScreen> {
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
      body: Consumer<GeneralViewModel>(builder: (context, language, child) {
        return Consumer<GeneralViewModel>(
            builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Padding(
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
                    'Submit your request',
                    style: MyTextStyles.medium20Black,
                  ),
                  SizedBox(
                    height: ConstantSize.getScaleHeight(context) * 8,
                  ),
                  Text(
                    'dummy_text'.tr(),
                    style: MyTextStyles.regular14gray,
                  ),
                  SizedBox(
                    height: ConstantSize.getScaleHeight(context) * 30,
                  ),
                  buildCustomTextField(
                      style: MyTextStyles.medium14gray,
                      context: context,
                      textEditingController: controller.supportNameController,
                      hintStyle: MyTextStyles.medium16Black,
                      title: 'your_name'.tr(),
                      hitText: 'Ahmad Rahal'),
                  SizedBox(
                    height: ConstantSize.getScaleHeight(context) * 24,
                  ),
                  buildCustomTextField(
                      style: MyTextStyles.medium14gray,
                      context: context,
                      textEditingController: controller.supportEmailController,
                      hintStyle: MyTextStyles.medium16Black,
                      title: 'email'.tr(),
                      hitText: 'ahmad.rahal@gmail.com'),
                  SizedBox(
                    height: ConstantSize.getScaleHeight(context) * 24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'phone_number'.tr(),
                      style: MyTextStyles.medium14gray,
                    ),
                  ),
                  SizedBox(
                    height: ConstantSize.getScaleHeight(context) * 10,
                  ),
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      TextFormField(
                        controller: controller.supportPhoneController,
                        style: MyTextStyles.medium16Black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                            50.0 +
                                ConstantSize.getScaleWidth(context) *
                                    80, // Adjusted for prefix width
                            ConstantSize.getHeight(context) * .001,
                            20.0,
                            ConstantSize.getHeight(context) * .001,
                          ),
                          counterStyle: const TextStyle(
                            height: double.minPositive,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors
                                  .textFiledborderGray, // Set this to the color you want when there's no error
                            ),
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Container(
                          height: ConstantSize.getScaleWidth(context) * 40,
                          color: AppColors.dropDownBgColor,
                          width: ConstantSize.getScaleWidth(context) * 55,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<CountryInfo>(
                              isExpanded: true,
                              value: controller.selectedCountry?.flag == ""
                                  ? controller.countryInfos[0]
                                  : controller.selectedCountry,
                              icon: const Icon(
                                CupertinoIcons.arrowtriangle_down_fill,
                                size: 15,
                              ),
                              items: controller.countryInfos
                                  .map((CountryInfo countryInfo) {
                                return DropdownMenuItem<CountryInfo>(
                                  value: countryInfo,
                                  child: Text(
                                    '${countryInfo.flag} ${countryInfo.countryCode}',
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                );
                              }).toList(),
                              selectedItemBuilder: (BuildContext context) {
                                return controller.countryInfos
                                    .map((CountryInfo countryInfo) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 1.9),
                                    child: Text(
                                      countryInfo.flag,
                                      style: const TextStyle(fontSize: 28.0),
                                    ),
                                  );
                                }).toList();
                              },
                              onChanged: (CountryInfo? newValue) {
                                setState(() {
                                  controller.selectedCountry = newValue;
                                  controller.code =
                                      controller.selectedCountry!.countryCode;
                                  print(
                                      controller.selectedCountry!.countryCode);
                                  // code=newValue!.countryCode;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: ConstantSize.getScaleWidth(context) *
                            80, // Adjust this value as per your requirement
                        child: Text(
                          "+49",
                          // controller.code == ""
                          //     ? "+49"
                          //     : '${controller.code} -',
                          style: MyTextStyles.medium16Black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ConstantSize.getScaleHeight(context) * 24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Message',
                      style: MyTextStyles.medium14gray,
                    ),
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                  SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 90,
                      child: TextField(
                        maxLines: 4, // makes it auto-expandable
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Enter your text here',
                          hintStyle: MyTextStyles.medium14gray,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.textFiledborderGray),
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.textFiledborderGray),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: ConstantSize.getScaleHeight(context) * 37,
                  ),
                  BtnPrimeryBackground(
                    onPressed: () {
                      // Navigator.pushNamed(context,ScreenRoutes.bottomNavBar);
                      //   if (authInForm.currentState!.validate()) {
                      //     controller.loginApi(context);
                      //   }
                    },
                    title: 'login'.tr(),
                    isLoading: false,
                    borderRadiusCircular: 8,
                    borderSideWidth: 0.1,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: AppColors.whiteColor,
                    ),
                    width: double.infinity,
                    height: ConstantSize.getScaleHeight(context) * 48.0,
                    backgroundColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
