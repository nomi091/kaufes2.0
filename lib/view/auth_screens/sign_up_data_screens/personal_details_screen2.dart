import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/custom_models/country_info_model.dart';
import '../../../view_model/auth_view_model/complete_signup_profil_view_model.dart';
import '../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';

class DetailProgressScreen2 extends StatefulWidget {
  const DetailProgressScreen2({super.key});

  @override
  State<DetailProgressScreen2> createState() => _DetailProgressScreen2State();
}

// AuthViewModel authViewModel = AuthViewModel();
bool showOtpField = false;
final FocusNode _phoneFocusNode = FocusNode();
String dropdownvalue = "";
// List of items in our dropdown menu
List<CountryInfo> countryInfos = [
  CountryInfo('🇩🇪', '+49'),
  CountryInfo('🇮🇹', '+39'),
  CountryInfo('🇨🇭', '+41'),
  CountryInfo('🇵🇰', '+92'),
  CountryInfo('🇦🇹', '+43'),
];
CountryInfo? selectedCountry;

class _DetailProgressScreen2State extends State<DetailProgressScreen2> {
  @override
  void initState() {
    selectedCountry = countryInfos.first;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileController =
          Provider.of<SignUpProfileViewModel>(context, listen: false);
      profileController.getProfileData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<SignUpProfileViewModel>(builder: (context, language, child) {
        return Consumer<SignUpProfileViewModel>(
            builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'email',
                    style: MyTextStyles.medium16Black,
                  ).tr(),
                ),
                SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                CustomTextField(
                  editable: false,
                  // controller: controller.businessSignInEmail,
                  hintText: controller.businessSignInEmail.text.toString(),
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                ),
                SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'phone_number',
                    style: MyTextStyles.medium16Black,
                  ).tr(),
                ),
                SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                SizedBox(
                  height: 70,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      TextFormField(
                        controller: controller.phoneNoController,
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
                              value: selectedCountry,
                              icon: const Icon(
                                CupertinoIcons.arrowtriangle_down_fill,
                                size: 15,
                              ),
                              items:
                                  countryInfos.map((CountryInfo countryInfo) {
                                return DropdownMenuItem<CountryInfo>(
                                  value: countryInfo,
                                  child: Text(
                                    '${countryInfo.flag} ${countryInfo.countryCode}',
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                );
                              }).toList(),
                              selectedItemBuilder: (BuildContext context) {
                                return countryInfos
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
                                  selectedCountry = newValue;
                                  controller.code =
                                      selectedCountry!.countryCode;
                                  print(selectedCountry!.countryCode);
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
                          controller.code == ""
                              ? "+49"
                              : '${controller.code} -',
                          style: MyTextStyles.medium16Black,
                        ),
                      ),
                    ],
                  ),
                ),
                controller.phoneNoController.text == ""
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "phone_validator".tr(),
                          style: MyTextStyles.errorStyleTextField,
                        ),
                      )
                    : Container(),
                SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                Visibility(
                    visible: showOtpField,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'check_phone',
                            style: MyTextStyles.medium16Black,
                          ).tr(),
                        ),
                        SizedBox(
                            height: ConstantSize.getHeight(context) * 0.015),
                        CustomTextField(
                          controller: controller.otpController,
                          hintText: 'enter_otp'.tr(),
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                        ),
                        SizedBox(
                            height: ConstantSize.getHeight(context) * 0.015),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'check_phone2',
                                style: MyTextStyles.medium14Black50Op,
                              ).tr(),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'resend_otp',
                                style: MyTextStyles.medium14Secondary,
                              ).tr(),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: ConstantSize.getHeight(context) * 0.015),
                      ],
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'password',
                    style: MyTextStyles.medium16Black,
                  ).tr(),
                ),
                SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                CustomTextField(
                  controller: controller.createPassword,
                  hintText: 'hintPassword'.tr(),
                  keyboardType: TextInputType.emailAddress,
                  //   icon: const Icon(Icons.remove_red_eye_rounded),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "passwrord_required".tr();
                    } else if (value.length < 8) {
                      return "length_validation".tr();
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
      }),
    );
  }
}

