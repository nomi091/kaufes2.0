import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/view/auth_screens/sign_up_data_screens/personal_details_screen1.dart';
import 'package:kaufes/view/auth_screens/sign_up_data_screens/personal_details_screen2.dart';
import 'package:kaufes/view/auth_screens/sign_up_data_screens/personal_details_screen3.dart';
import 'package:kaufes/widgets/global_widgets/align_left_text.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../view_model/auth_view_model/complete_signup_profil_view_model.dart';
import '../../widgets/global_widgets/filter_app_bar.dart';
import 'auth_widget/custom_button.dart';

class DetailProgressScreen extends StatefulWidget {
  const DetailProgressScreen({Key? key}) : super(key: key);

  @override
  _DetailProgressScreenState createState() => _DetailProgressScreenState();
}

// AuthViewModel authViewModel = AuthViewModel();

class _DetailProgressScreenState extends State<DetailProgressScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _totalPages = 3;

  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double calculateProgressPercentage() {
    return (_currentPage + 1) / 3.3 * 100;
  }

  @override
  Widget build(BuildContext context) {
    double progressPercentage = calculateProgressPercentage();
    void nextPage() async {
      if (_formKeys[_currentPage].currentState!.validate()) {
        if (_currentPage == 0) {
          await context
              .read<SignUpProfileViewModel>()
              .completeProfileApi1(context);
        } else if (_currentPage == 1) {
          await context
              .read<SignUpProfileViewModel>()
              .completeProfileApi2(context);
        } else if (_currentPage == 2) {
          await context
              .read<SignUpProfileViewModel>()
              .completeProfileApi3(context);
        } else {
          _pageController.animateToPage(
            _currentPage + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    }

    return Scaffold(
        appBar: FilterAppBar(
          onTapTrailing: () {},
          onTapBack: () {
            //  Navigator.pop(context);
            Navigator.pushNamed(context, ScreenRoutes.detailProgressScreen);
          },
          height: ConstantSize.getHeight(context) * 0.05,
          title: 'Back'.tr(),
          subTitle: '',
          trailingCheck: false,
        ),
        body: Consumer<SignUpProfileViewModel>(
            builder: (context, controller, child) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.pushNamed(context, ScreenRoutes.logIn);
              return true;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ConstantSize.getHeight(context) * 0.02,
                  horizontal: ConstantSize.getWidth(context) * 0.03,
                ),
                child: SizedBox(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'complete_profile',
                          style: MyTextStyles.regularNormalBlack,
                        ).tr(),
                      ),
                      SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 16,
                      ),
                      Center(
                        child: SizedBox(
                          height: 10.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _totalPages,
                            // itemExtent: 123.0,
                            itemBuilder: (context, index) {
                              Color progressColor = index <= _currentPage
                                  ? AppColors.primaryColor
                                  : Colors.grey;
                              return Row(
                                children: [
                                  Container(
                                    width:
                                        ConstantSize.getWidth(context) * 0.28,
                                    decoration: BoxDecoration(
                                      color: progressColor,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        ConstantSize.getWidth(context) * 0.045,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 25,
                      ),
                      Row(
                        children: [
                          alignCenterLeft(
                            Text(
                              '${progressPercentage.toStringAsFixed(0)}%\t',
                              style: MyTextStyles.biggerFont24BlackMdeium,
                            ),
                          ),
                          alignCenterLeft(
                            Text(
                              'complete'.tr(),
                              style: MyTextStyles.regular16Gray,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 16,
                      ),
                      alignCenterLeft(
                        Text(
                          'personal_details',
                          style: MyTextStyles.regular16Black,
                        ).tr(),
                      ),
                      SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 24,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            children: [
                              Form(
                                  key: _formKeys[0],
                                  child: const DetailProgressScreen1()),
                              Form(
                                  key: _formKeys[1],
                                  child: const DetailProgressScreen2()),
                              Form(
                                  key: _formKeys[2],
                                  child: const DetailProgressScreen3()),
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildCustomButton(
                              context: context,
                              title: 'submit'.tr(),
                              buttonPressed: () async {
                                if (_formKeys[_currentPage]
                                    .currentState!
                                    .validate()) {
                                  if (_currentPage == 0) {
                                    await context
                                        .read<SignUpProfileViewModel>()
                                        .completeProfileApi1(context);
                                  } else if (_currentPage == 1) {
                                    await context
                                        .read<SignUpProfileViewModel>()
                                        .completeProfileApi2(context);
                                  } else if (_currentPage == 2) {
                                    await context
                                        .read<SignUpProfileViewModel>()
                                        .completeProfileApi3(context);
                                  }
                                  if (_currentPage == _totalPages - 1) {
                                  } else if (controller.validate) {
                                    _pageController.animateToPage(
                                      _currentPage + 1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  } else {
                                    print('validation error');
                                  }
                                }
                              },
                              isLoading: false),
                          SizedBox(
                            height: ConstantSize.getScaleHeight(context) * 15,
                          ),
                          buildCustomButton2(
                              context: context,
                              isLoading: false,
                              title: 'skip'.tr(),
                              buttonPressed: () {
                                Navigator.pushNamed(
                                    context, ScreenRoutes.bottomNavBar);
                              }),
                        ],
                      )

                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
