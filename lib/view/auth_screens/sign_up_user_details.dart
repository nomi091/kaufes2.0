import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/res/widgets/global_widgets/align_left_text.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:kaufes/view/auth_screens/sign_up_data_screens/personal_details_screen1.dart';
import 'package:kaufes/view/auth_screens/sign_up_data_screens/personal_details_screen2.dart';
import 'package:kaufes/view/auth_screens/sign_up_data_screens/personal_details_screen3.dart';
import 'package:kaufes/view_model/auth_view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/widgets/global_widgets/filter_app_bar.dart';
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
    void nextPage() {
      if (_currentPage == _totalPages - 1 &&
          _formKeys[_currentPage].currentState!.validate()) {
        Navigator.pushNamed(context, ScreenRoutes.successScreen);
      } else if (_currentPage < _totalPages - 1 &&
          _formKeys[_currentPage].currentState!.validate()) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    return Scaffold(
      appBar: FilterAppBar(
        onTapTrailing: () {},
        onTapBack: () {
          Navigator.pushNamed(context, ScreenRoutes.logIn);
        },
        height: ConstantSize.getHeight(context) * 0.05,
        title: 'profile'.tr(),
        subTitle: '',
        trailingCheck: false,
      ),
      body: Consumer<AuthViewModel>(builder: (context, language, child) {
        return Consumer<AuthViewModel>(builder: (context, controller, child) {
          return SingleChildScrollView(
            child: WillPopScope(
              onWillPop: () async {
                Navigator.pushNamed(context, ScreenRoutes.logIn);
                return true;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ConstantSize.getHeight(context) * 0.02,
                  horizontal: ConstantSize.getWidth(context) * 0.03,
                ),
                child: SizedBox(
                  height: ConstantSize.getHeight(context) * 0.85,
                  // width: ConstantSize.getWidth(context)*0.8,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'complete_profile',
                          style: MyTextStyles.regularNormalBlack,
                        ).tr(),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: 10.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _totalPages,
                              itemExtent: 135.0,
                              itemBuilder: (context, index) {
                                Color progressColor = index <= _currentPage
                                    ? AppColors.primaryColor
                                    : Colors.grey;
                                return Row(
                                  children: [
                                    Container(
                                      width:
                                          ConstantSize.getWidth(context) * 0.25,
                                      decoration: BoxDecoration(
                                        color: progressColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          ConstantSize.getWidth(context) * 0.03,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          alignCenterLeft(
                            Text(
                              '${progressPercentage.toStringAsFixed(0)}%\t',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          alignCenterLeft(
                            Text(
                              'complete'.tr(),
                              style: MyTextStyles.detailCardNormalBlack,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ConstantSize.getHeight(context) * 0.02,
                      ),
                      alignCenterLeft(
                        Text(
                          'login_details',
                          style: MyTextStyles.regularDetailBoldBlack,
                        ).tr(),
                      ),
                      SizedBox(
                        height: ConstantSize.getHeight(context) * 0.02,
                      ),
                      Expanded(
                        flex: 14,
                        child: PageView(
                            // physics: const NeverScrollableScrollPhysics(),
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
                      buildCustomButton(
                          context: context,
                          title: 'save_details'.tr(),
                          buttonPressed: nextPage,
                          isLoading: false),
                      SizedBox(height: ConstantSize.getHeight(context) * 0.02),
                      buildCustomButton2(
                          context: context,
                          isLoading: false,
                          title: 'skip'.tr(),
                          buttonPressed: () {
                            Navigator.pushNamed(
                                context, ScreenRoutes.bottomNavBar);
                            controller.nextScreen();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
