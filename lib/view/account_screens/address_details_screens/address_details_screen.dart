import 'package:csc_picker/csc_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/account_view_model/account_view_model.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../widgets/global_widgets/primary_button.dart';
import '../login_security_screen/login_security_widgets/custom_text_field.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ConstantSize.getWidth(context) * 0.06),
        child:
            Consumer<AccountViewModel>(builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ConstantSize.getScaleHeight(context) * 24,
                ),
                Text(
                  'Address Details',
                  style: MyTextStyles.medium20Black,
                ),
                SizedBox(
                  height: ConstantSize.getScaleHeight(context) * 40,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.addressitems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: AppColors.deviderColor)),
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
                                Text(controller.addressitems[index].text,
                                    style: MyTextStyles.regular14gray),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        bool anyTrue =
                                            controller.anyAddresItemTrue();
                                        if (!anyTrue ||
                                            (anyTrue &&
                                                controller.addressitems[index]
                                                    .value)) {
                                          controller.addressitems[index].value =
                                              !controller
                                                  .addressitems[index].value;
                                        }
                                      });
                                    },
                                    child: controller.addressitems[index].value
                                        ? Text('Cancel',
                                            style: MyTextStyles.medium14Red)
                                        : Text(
                                            controller
                                                .addressitems[index].text2,
                                            style: controller
                                                    .anyAddresItemTrue()
                                                ? MyTextStyles.medium14gray
                                                : MyTextStyles.medium14Black))
                              ],
                            ),
                            SizedBox(
                              height: ConstantSize.getScaleHeight(context) * 16,
                            ),
                            controller.addressitems[index].value
                                ? Visibility(
                                    visible:
                                        controller.addressitems[index].value,
                                    child: controller
                                                .addressitems[index].text ==
                                            "Primary Address"
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .addressTextFieldItems
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: ConstantSize
                                                                .getScaleHeight(
                                                                    context) *
                                                            18),
                                                    child: buildCustomTextField(
                                                      style: MyTextStyles
                                                          .medium14Black,
                                                      hintStyle: MyTextStyles
                                                          .medium16Black,
                                                      context: context,
                                                      textEditingController:
                                                          controller
                                                              .currentPasswordController,
                                                      title: controller
                                                          .addressTextFieldItems[
                                                              index]
                                                          .text,
                                                      hitText: controller
                                                          .addressTextFieldItems[
                                                              index]
                                                          .title,
                                                    ),
                                                  );
                                                },
                                              ),
                                              Row(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'country'.tr(),
                                                      style: MyTextStyles
                                                          .medium14Black,
                                                    ).tr(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        ConstantSize.getWidth(
                                                                context) *
                                                            0.35,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      'state'.tr(),
                                                      style: MyTextStyles
                                                          .medium14Black,
                                                    ).tr(),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                    ConstantSize.getScaleHeight(
                                                            context) *
                                                        11,
                                              ),
                                              CSCPicker(
                                                showStates: true,
                                                showCities: false,
                                                layout: Layout.horizontal,
                                                flagState: CountryFlag.ENABLE,

                                                dropdownDecoration:
                                                    BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    5)),
                                                        // color: Colors.white,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.5),
                                                            width: 1)),
                                                disabledDropdownDecoration:
                                                    BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius
                                                                    .circular(
                                                                        5)),
                                                        color: AppColors
                                                            .whiteColor,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.5),
                                                            width: 1)),

                                                countrySearchPlaceholder:
                                                    "Country",
                                                citySearchPlaceholder: "City",
                                                countryDropdownLabel: "Country",
                                                cityDropdownLabel: "City",
                                                // countryFilter: const [
                                                //   CscCountry.Germany,
                                                //   CscCountry.Swaziland,
                                                //   CscCountry.Austria
                                                // ],

                                                selectedItemStyle:
                                                    const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),

                                                dropdownHeadingStyle:
                                                    const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),

                                                dropdownItemStyle:
                                                    const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),

                                                dropdownDialogRadius: 10.0,

                                                searchBarRadius: 10.0,

                                                onCountryChanged: (value) {
                                                  setState(() {
                                                    ///store value in country variable
                                                    //    controller.countryValue = value.toString();
                                                  });
                                                },

                                                onStateChanged: (value) {
                                                  setState(() {
                                                    ///store value in state variable
                                                    //  controller.stateValue = value.toString();
                                                  });
                                                },

                                                onCityChanged: (value) {
                                                  setState(() {
                                                    //  controller.cityValue = value.toString();
                                                  });
                                                },
                                              ),
                                             
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '',
                                                  //   controller.countryError.tr(),
                                                  style: MyTextStyles
                                                      .errorStyleTextField,
                                                ).tr(),
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
                                                width:
                                                    ConstantSize.getScaleWidth(
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
                                        : controller.addressitems[index].text ==
                                                "Address 2"
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                        .addressTextFieldItems
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom: ConstantSize
                                                                    .getScaleHeight(
                                                                        context) *
                                                                18),
                                                        child:
                                                            buildCustomTextField(
                                                          style: MyTextStyles
                                                              .medium14Black,
                                                          hintStyle: MyTextStyles
                                                              .medium16Black,
                                                          context: context,
                                                          textEditingController:
                                                              controller
                                                                  .currentPasswordController,
                                                          title: controller
                                                              .addressTextFieldItems[
                                                                  index]
                                                              .text,
                                                          hitText: controller
                                                              .addressTextFieldItems[
                                                                  index]
                                                              .title,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'country'.tr(),
                                                          style: MyTextStyles
                                                              .medium14Black,
                                                        ).tr(),
                                                      ),
                                                      SizedBox(
                                                        width: ConstantSize
                                                                .getWidth(
                                                                    context) *
                                                            0.35,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          'state'.tr(),
                                                          style: MyTextStyles
                                                              .medium14Black,
                                                        ).tr(),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: ConstantSize
                                                            .getScaleHeight(
                                                                context) *
                                                        11,
                                                  ),
                                                  CSCPicker(
                                                    showStates: true,
                                                    showCities: false,
                                                    flagState:
                                                        CountryFlag.ENABLE,

                                                    dropdownDecoration:
                                                        BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius.all(
                                                                    Radius.circular(
                                                                        5)),
                                                            // color: Colors.white,
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .blackColor
                                                                    .withOpacity(
                                                                        0.5),
                                                                width: 1)),
                                                    disabledDropdownDecoration:
                                                        BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                            color: AppColors
                                                                .whiteColor,
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .blackColor
                                                                    .withOpacity(
                                                                        0.5),
                                                                width: 1)),

                                                    countrySearchPlaceholder:
                                                        "Country",
                                                    citySearchPlaceholder:
                                                        "City",
                                                    countryDropdownLabel:
                                                        "Country",
                                                    cityDropdownLabel: "City",

                                                    // countryFilter: const [
                                                    //   CscCountry.Germany,
                                                    //   CscCountry.Swaziland,
                                                    //   CscCountry.Austria
                                                    // ],

                                                    selectedItemStyle:
                                                        const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),

                                                    dropdownHeadingStyle:
                                                        const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),

                                                    dropdownItemStyle:
                                                        const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),

                                                    dropdownDialogRadius: 10.0,

                                                    searchBarRadius: 10.0,

                                                    onCountryChanged: (value) {
                                                      setState(() {
                                                        ///store value in country variable
                                                        //    controller.countryValue = value.toString();
                                                      });
                                                    },

                                                    onStateChanged: (value) {
                                                      setState(() {
                                                        ///store value in state variable
                                                        //  controller.stateValue = value.toString();
                                                      });
                                                    },

                                                    onCityChanged: (value) {
                                                      setState(() {
                                                        //  controller.cityValue = value.toString();
                                                      });
                                                    },
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      '',
                                                      //   controller.countryError.tr(),
                                                      style: MyTextStyles
                                                          .errorStyleTextField,
                                                    ).tr(),
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
                                              )
                                            : controller.addressitems[index]
                                                        .text ==
                                                    "Address 3"
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .addressTextFieldItems
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding: EdgeInsets.only(
                                                                bottom: ConstantSize
                                                                        .getScaleHeight(
                                                                            context) *
                                                                    18),
                                                            child:
                                                                buildCustomTextField(
                                                              style: MyTextStyles
                                                                  .medium14Black,
                                                              hintStyle:
                                                                  MyTextStyles
                                                                      .medium16Black,
                                                              context: context,
                                                              textEditingController:
                                                                  controller
                                                                      .currentPasswordController,
                                                              title: controller
                                                                  .addressTextFieldItems[
                                                                      index]
                                                                  .text,
                                                              hitText: controller
                                                                  .addressTextFieldItems[
                                                                      index]
                                                                  .title,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Row(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              'country'.tr(),
                                                              style: MyTextStyles
                                                                  .medium14Black,
                                                            ).tr(),
                                                          ),
                                                          SizedBox(
                                                            width: ConstantSize
                                                                    .getWidth(
                                                                        context) *
                                                                0.35,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              'state'.tr(),
                                                              style: MyTextStyles
                                                                  .medium14Black,
                                                            ).tr(),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: ConstantSize
                                                                .getScaleHeight(
                                                                    context) *
                                                            11,
                                                      ),
                                                      CSCPicker(
                                                        showStates: true,
                                                        showCities: false,
                                                        flagState:
                                                            CountryFlag.ENABLE,

                                                        dropdownDecoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            5)),
                                                                // color: Colors.white,
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .blackColor
                                                                        .withOpacity(
                                                                            0.5),
                                                                    width: 1)),
                                                        disabledDropdownDecoration: BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                            color: AppColors
                                                                .whiteColor,
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .blackColor
                                                                    .withOpacity(
                                                                        0.5),
                                                                width: 1)),

                                                        countrySearchPlaceholder:
                                                            "Country",
                                                        citySearchPlaceholder:
                                                            "City",
                                                        countryDropdownLabel:
                                                            "Country",
                                                        cityDropdownLabel:
                                                            "City",

                                                        // countryFilter: const [
                                                        //   CscCountry.Germany,
                                                        //   CscCountry.Swaziland,
                                                        //   CscCountry.Austria
                                                        // ],

                                                        selectedItemStyle:
                                                            const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),

                                                        dropdownHeadingStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),

                                                        dropdownItemStyle:
                                                            const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),

                                                        dropdownDialogRadius:
                                                            10.0,

                                                        searchBarRadius: 10.0,

                                                        onCountryChanged:
                                                            (value) {
                                                          setState(() {
                                                            ///store value in country variable
                                                            //    controller.countryValue = value.toString();
                                                          });
                                                        },

                                                        onStateChanged:
                                                            (value) {
                                                          setState(() {
                                                            ///store value in state variable
                                                            //  controller.stateValue = value.toString();
                                                          });
                                                        },

                                                        onCityChanged: (value) {
                                                          setState(() {
                                                            //  controller.cityValue = value.toString();
                                                          });
                                                        },
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          '',
                                                          //   controller.countryError.tr(),
                                                          style: MyTextStyles
                                                              .errorStyleTextField,
                                                        ).tr(),
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
                                                            AppColors
                                                                .primaryColor,
                                                        borderColor: AppColors
                                                            .primaryColor,
                                                      )
                                                    ],
                                                  )
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .addressTextFieldItems
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding: EdgeInsets.only(
                                                                bottom: ConstantSize
                                                                        .getScaleHeight(
                                                                            context) *
                                                                    18),
                                                            child:
                                                                buildCustomTextField(
                                                              style: MyTextStyles
                                                                  .medium14Black,
                                                              hintStyle:
                                                                  MyTextStyles
                                                                      .medium16Black,
                                                              context: context,
                                                              textEditingController:
                                                                  controller
                                                                      .currentPasswordController,
                                                              title: controller
                                                                  .addressTextFieldItems[
                                                                      index]
                                                                  .text,
                                                              hitText: controller
                                                                  .addressTextFieldItems[
                                                                      index]
                                                                  .title,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Row(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              'country'.tr(),
                                                              style: MyTextStyles
                                                                  .medium14Black,
                                                            ).tr(),
                                                          ),
                                                          SizedBox(
                                                            width: ConstantSize
                                                                    .getWidth(
                                                                        context) *
                                                                0.35,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              'state'.tr(),
                                                              style: MyTextStyles
                                                                  .medium14Black,
                                                            ).tr(),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: ConstantSize
                                                                .getScaleHeight(
                                                                    context) *
                                                            11,
                                                      ),
                                                      CSCPicker(
                                                        showStates: true,
                                                        showCities: false,
                                                        flagState:
                                                            CountryFlag.ENABLE,

                                                        dropdownDecoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            5)),
                                                                // color: Colors.white,
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .blackColor
                                                                        .withOpacity(
                                                                            0.5),
                                                                    width: 1)),
                                                        disabledDropdownDecoration: BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                            color: AppColors
                                                                .whiteColor,
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .blackColor
                                                                    .withOpacity(
                                                                        0.5),
                                                                width: 1)),

                                                        countrySearchPlaceholder:
                                                            "Country",
                                                        citySearchPlaceholder:
                                                            "City",
                                                        countryDropdownLabel:
                                                            "Country",
                                                        cityDropdownLabel:
                                                            "City",

                                                        // countryFilter: const [
                                                        //   CscCountry.Germany,
                                                        //   CscCountry.Swaziland,
                                                        //   CscCountry.Austria
                                                        // ],

                                                        selectedItemStyle:
                                                            const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),

                                                        dropdownHeadingStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),

                                                        dropdownItemStyle:
                                                            const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),

                                                        dropdownDialogRadius:
                                                            10.0,

                                                        searchBarRadius: 10.0,

                                                        onCountryChanged:
                                                            (value) {
                                                          setState(() {
                                                            ///store value in country variable
                                                            //    controller.countryValue = value.toString();
                                                          });
                                                        },

                                                        onStateChanged:
                                                            (value) {
                                                          setState(() {
                                                            ///store value in state variable
                                                            //  controller.stateValue = value.toString();
                                                          });
                                                        },

                                                        onCityChanged: (value) {
                                                          setState(() {
                                                            //  controller.cityValue = value.toString();
                                                          });
                                                        },
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          '',
                                                          //   controller.countryError.tr(),
                                                          style: MyTextStyles
                                                              .errorStyleTextField,
                                                        ).tr(),
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
                                                            AppColors
                                                                .primaryColor,
                                                        borderColor: AppColors
                                                            .primaryColor,
                                                      )
                                                    ],
                                                  ))
                                : Text(
                                    controller.addressitems[index].title,
                                    style: MyTextStyles.regular16Black,
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
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
        }),
      ),
    );
  }
}
