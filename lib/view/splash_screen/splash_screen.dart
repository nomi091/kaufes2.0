import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/view_model/auth_view_model/auth_view_model.dart';

import '../../utils/constants/circular_progress_indecator.dart';
import '../../utils/constants/image_paths.dart';
import '../../utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

AuthViewModel authViewModel = AuthViewModel();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToNextScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.otherSplashImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.spalashLogo,
                  ),
                  SizedBox(height: ConstantSize.getHeight(context) * 0.06),
                  const CustomCicularProgressIndecator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToNextScreen() {
    // Future.delayed(const Duration(seconds: 3)).then((value) {
    //   authViewModel.checkVerificationStatus(context);
    // });
    Navigator.pushNamed(context, ScreenRoutes.bottomNavBar);
  }
}
