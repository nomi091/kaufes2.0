import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/view/account_screens/login_security_screen/login_security_widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../model/custom_models/country_info_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../view_model/account_view_model/account_view_model.dart';
import '../../../../widgets/global_widgets/custom_devider.dart';
import '../../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../../widgets/global_widgets/primary_button.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(builder: (context, controller, child) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 24,
            ),
            Text(
              'Login and Security',
              style: MyTextStyles.medium20Black,
            ),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 24,
            ),
            Text(
              'Email',
              style: MyTextStyles.regular14gray,
            ),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 10,
            ),
            Text(
              'Ahmad.rahal@gmail.com',
              style: MyTextStyles.medium16Black,
            ),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 16,
            ),
            const CustomDivider(
              indent: 0.0,
              endIndent: 0.0,
              color: AppColors.deviderColor,
            ),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 16,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.loginSecurityItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.deviderColor)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ConstantSize.getScaleHeight(context) * 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.loginSecurityItems[index].text,
                                style: MyTextStyles.regular14gray),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    bool anyTrue = controller.anyItemTrue();
                                    if (!anyTrue ||
                                        (anyTrue &&
                                            controller.loginSecurityItems[index]
                                                .value)) {
                                      controller.loginSecurityItems[index].value =
                                          !controller
                                              .loginSecurityItems[index].value;
                                    }
                                  });
                                },
                                child: controller.loginSecurityItems[index].value
                                    ? Text('Cancel',
                                        style: MyTextStyles.medium14Red)
                                    : Text(
                                        controller
                                            .loginSecurityItems[index].text2,
                                        style: controller.anyItemTrue()
                                            ? MyTextStyles.medium14gray 
                                            : MyTextStyles.medium14Black))
                          ],
                        ),
                        SizedBox(
                          height: ConstantSize.getScaleHeight(context) * 16,
                        ),
                        controller.loginSecurityItems[index].value
                            ? Visibility(
                                visible:
                                    controller.loginSecurityItems[index].value,
                                child: controller
                                            .loginSecurityItems[index].text2 ==
                                        "Edit"
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextField(
                                            controller:
                                                controller.userNameController,
                                            hintText: 'Rahal123',
                                            keyboardType: TextInputType.name,
                                            maxLines: 1,
                                          ),
                                          SizedBox(
                                            height: ConstantSize.getScaleHeight(
                                                    context) *
                                                26,
                                          ),
                                          BtnPrimeryBackground(
                                            onPressed: () {
                                              // Navigator.pushNamed(
                                              //     context, ScreenRoutes.bottomNavBar);
                                              // if (authInForm.currentState!.validate()) {
                                              //   controller.loginApi(context);
                                              // }
                                            },
                                            title: 'Save'.tr(),
                                            isLoading: false,
                                            borderRadiusCircular: 8,
                                            borderSideWidth: 0.1,
                                            textStyle: MyTextStyles.medium16white,
                                            width: ConstantSize.getScaleWidth(
                                                    context) *
                                                88.0,
                                            height: ConstantSize.getScaleHeight(
                                                    context) *
                                                48.0,
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            borderColor: AppColors.primaryColor,
                                          )
                                        ],
                                      )
                                    : controller.loginSecurityItems[index]
                                                .text2 ==
                                            "Reset"
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              buildCustomTextField(
                                                  style:
                                                      MyTextStyles.medium16Black,
                                                  context: context,
                                                  textEditingController: controller
                                                      .currentPasswordController,
                                                  title: 'Current Password',
                                                  hitText:
                                                      'Enter Current Password'),
                                              SizedBox(
                                                height:
                                                    ConstantSize.getScaleHeight(
                                                            context) *
                                                        24,
                                              ),
                                              buildCustomTextField(
                                                  style:
                                                      MyTextStyles.medium16Black,
                                                  context: context,
                                                  textEditingController: controller
                                                      .currentPasswordController,
                                                  title: 'New Password',
                                                  hitText: 'Enter New Password'),
                                              SizedBox(
                                                height:
                                                    ConstantSize.getScaleHeight(
                                                            context) *
                                                        24,
                                              ),
                                              buildCustomTextField(
                                                  style:
                                                      MyTextStyles.medium16Black,
                                                  context: context,
                                                  textEditingController: controller
                                                      .currentPasswordController,
                                                  title: 'Confirm New Password',
                                                  hitText:
                                                      'Enter Confirm New Password'),
                                              SizedBox(
                                                height:
                                                    ConstantSize.getScaleHeight(
                                                            context) *
                                                        24,
                                              ),
                                              BtnPrimeryBackground(
                                                onPressed: () {
                                                  // Navigator.pushNamed(
                                                  //     context, ScreenRoutes.bottomNavBar);
                                                  // if (authInForm.currentState!.validate()) {
                                                  //   controller.loginApi(context);
                                                  // }
                                                },
                                                title: 'Save'.tr(),
                                                isLoading: false,
                                                borderRadiusCircular: 8,
                                                borderSideWidth: 0.1,
                                                textStyle:
                                                    MyTextStyles.medium16white,
                                                width: ConstantSize.getScaleWidth(
                                                        context) *
                                                    88.0,
                                                height:
                                                    ConstantSize.getScaleHeight(
                                                            context) *
                                                        48.0,
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                borderColor:
                                                    AppColors.primaryColor,
                                              )
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              SizedBox(
                                                height: 70,
                                                child: Stack(
                                                  alignment: Alignment.centerLeft,
                                                  children: [
                                                    TextFormField(
                                                      controller: controller
                                                          .phoenNumberController,
                                                      style: MyTextStyles
                                                          .medium16Black,
                                                      decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                          50.0 +
                                                              ConstantSize
                                                                      .getScaleWidth(
                                                                          context) *
                                                                  80, // Adjusted for prefix width
                                                          ConstantSize.getHeight(
                                                                  context) *
                                                              .001,
                                                          20.0,
                                                          ConstantSize.getHeight(
                                                                  context) *
                                                              .001,
                                                        ),
                                                        counterStyle:
                                                            const TextStyle(
                                                          height:
                                                              double.minPositive,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: AppColors
                                                                .textFiledborderGray, // Set this to the color you want when there's no error
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8.0,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4.0),
                                                      child: Container(
                                                        height: ConstantSize
                                                                .getScaleWidth(
                                                                    context) *
                                                            40,
                                                        color: AppColors
                                                            .dropDownBgColor,
                                                        width: ConstantSize
                                                                .getScaleWidth(
                                                                    context) *
                                                            55,
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              CountryInfo>(
                                                            isExpanded: true,
                                                            value: controller
                                                                        .selectedCountry
                                                                        ?.flag ==
                                                                    ""
                                                                ? controller
                                                                        .countryInfos[
                                                                    0]
                                                                : controller
                                                                    .selectedCountry,
                                                            icon: const Icon(
                                                              CupertinoIcons
                                                                  .arrowtriangle_down_fill,
                                                              size: 15,
                                                            ),
                                                            items: controller
                                                                .countryInfos
                                                                .map((CountryInfo
                                                                    countryInfo) {
                                                              return DropdownMenuItem<
                                                                  CountryInfo>(
                                                                value:
                                                                    countryInfo,
                                                                child: Text(
                                                                  '${countryInfo.flag} ${countryInfo.countryCode}',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18.0),
                                                                ),
                                                              );
                                                            }).toList(),
                                                            selectedItemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return controller
                                                                  .countryInfos
                                                                  .map((CountryInfo
                                                                      countryInfo) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              1.9),
                                                                  child: Text(
                                                                    countryInfo
                                                                        .flag,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            28.0),
                                                                  ),
                                                                );
                                                              }).toList();
                                                            },
                                                            onChanged:
                                                                (CountryInfo?
                                                                    newValue) {
                                                              setState(() {
                                                                controller
                                                                        .selectedCountry =
                                                                    newValue;
                                                                controller.code =
                                                                    controller
                                                                        .selectedCountry!
                                                                        .countryCode;
                                                                print(controller
                                                                    .selectedCountry!
                                                                    .countryCode);
                                                                // code=newValue!.countryCode;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: ConstantSize
                                                              .getScaleWidth(
                                                                  context) *
                                                          80, // Adjust this value as per your requirement
                                                      child: Text(
                                                        controller.code == ""
                                                            ? "+49"
                                                            : '${controller.code} -',
                                                        style: MyTextStyles
                                                            .medium16Black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          controller.isOtp = true;
                                                        });
                                                      },
                                                      child: const Text(
                                                          'Send OTP'))),
                                              Visibility(
                                                visible: controller.isOtp,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    buildCustomTextField(
                                                        style: MyTextStyles
                                                            .regular16Black,
                                                        context: context,
                                                        textEditingController:
                                                            controller
                                                                .currentPasswordController,
                                                        title: 'Enter OTP',
                                                        hitText: 'OTP Code'),
                                                    SizedBox(
                                                      height: ConstantSize
                                                              .getScaleHeight(
                                                                  context) *
                                                          10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Does not received the OTP code!\t',
                                                          style: MyTextStyles
                                                              .regular14gray,
                                                        ),
                                                        Text(
                                                          'Send Again!',
                                                          style: MyTextStyles
                                                              .medium14Secondary,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: ConstantSize
                                                              .getScaleHeight(
                                                                  context) *
                                                          16,
                                                    ),
                                                    BtnPrimeryBackground(
                                                      onPressed: () {
                                                        // Navigator.pushNamed(
                                                        //     context, ScreenRoutes.bottomNavBar);
                                                        // if (authInForm.currentState!.validate()) {
                                                        //   controller.loginApi(context);
                                                        // }
                                                      },
                                                      title: 'Save'.tr(),
                                                      isLoading: false,
                                                      borderRadiusCircular: 8,
                                                      borderSideWidth: 0.1,
                                                      textStyle: MyTextStyles
                                                          .medium16white,
                                                      width: ConstantSize
                                                              .getScaleWidth(
                                                                  context) *
                                                          88.0,
                                                      height: ConstantSize
                                                              .getScaleHeight(
                                                                  context) *
                                                          48.0,
                                                      backgroundColor:
                                                          AppColors.primaryColor,
                                                      borderColor:
                                                          AppColors.primaryColor,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                              )
                            : controller.anyItemTrue()
                                ? Text(
                                    controller.loginSecurityItems[index].title,
                                    style: MyTextStyles.medium14gray,
                                  )
                                : Text(
                                    controller.loginSecurityItems[index].title,
                                    style: MyTextStyles.medium16Black,
                                  ),
                        SizedBox(
                          height: ConstantSize.getScaleHeight(context) * 16,
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      );
    });
  }
}
