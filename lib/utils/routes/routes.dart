import 'package:flutter/material.dart';
import 'package:kaufes/view/home_screens/all_categories_list_screen/all_categories_list.dart';
import 'package:kaufes/view/home_screens/all_sub_categories_list_screen/subcategories_list.dart';
import 'package:kaufes/view/home_screens/home_screen.dart';

import '../../view/auth_screens/forgot_password/email_confirmation.dart';
import '../../view/auth_screens/forgot_password/reset_password_screen.dart';
import '../../view/auth_screens/forgot_password/verify_account_screen.dart';
import '../../view/auth_screens/login_screen.dart';
import '../../view/auth_screens/select_account_type.dart';
import '../../view/auth_screens/sign_up_data_screens/success_screen.dart';
import '../../view/auth_screens/sign_up_user_details.dart';
import '../../view/auth_screens/signup_screen.dart';
import '../../view/bottom_navbar/bottom_navbar.dart';
import '../../view/create_ad_screen/ads_contact_screen.dart';
import '../../view/create_ad_screen/ads_detail_screen.dart';
import '../../view/create_ad_screen/ads_location_Screen.dart';
import '../../view/create_ad_screen/ads_media_screen.dart';
import '../../view/create_ad_screen/ads_pricing_screen.dart';
import '../../view/home_screens/favourite_screen/favourite_screen.dart';
import '../../view/home_screens/filter_screen/filter_home_screen.dart';
import '../../view/home_screens/filter_screen/filter_page.dart';
import '../../view/home_screens/notifications_screen/notfications.dart';
import '../../view/global_cards/product_detail_screen.dart';
import '../../view/splash_screen/splash_screen.dart';
import 'custom_page_route.dart';

class ScreenRoutes {
  static const String splash = "splash";
  static const String onbroding = "OnBording";
  static const String logIn = "login";
  static const String signUp = "signUp";
  static const String bottomNavBar = "botomNaveBar";
  //Home paths
  static const String homeScreen = "homeScreen";
  static const String productDetailScreen = "productDetailScreen";
  static const String notificationsScreen = "notificationsScreen";
  static const String favouriteScreen = "favouriteScreen";
  static const String allCategoriesList = "allCategoriesList";
  static const String subCategoriesList = "subCategoriesList";
  static const String filterHomeScreen = "filterHomeScreen";
  static const String filterScreen = "filterScreen";
  static const String createAdDetailScreen = "createAdDetailScreen";
  static const String setAdsPriceScreen = "setAdsPriceScreen";
  static const String setAdsLocationScreen = "SetAdsLocationScreen";
  static const String uploadMediaScreen = "uploadMediaScreen";
  static const String adsReviewContactScreen = "adsReviewContactScreen";
  static const String emailConfirmationScreen = "emailConfirmationScreen";
  static const String detailProgressScreen = "detailProgressScreen";
  static const String verifyScreen = "verifyScreen";
  static const String successScreen = "successScreen";
  static const String resetPasswordScreen = "resetPasswordScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// WalkThrough FLOW
      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      case splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );

      case onbroding:
        return CustomPageRoute(
          child: const OnboardingScreen(),
        );
      case logIn:
        return CustomPageRoute(
          child: const LoginScreen(),
        );
      case signUp:
        return CustomPageRoute(
          child: const SignUpScreen(),
        );
      case bottomNavBar:
        return CustomPageRoute(
          child: const BottomNavBar(),
        );
      case homeScreen:
        return CustomPageRoute(
          child: const HomeScreen(),
        );
      case productDetailScreen:
        return CustomPageRoute(
          child: const ProductDetails(),
        );
      case notificationsScreen:
        return CustomPageRoute(
          child: const InAppNotificationScreen(),
        );
      case favouriteScreen:
        return CustomPageRoute(
          child: const FavoriteScreen(),
        );
      case allCategoriesList:
        return CustomPageRoute(
          child: const AllCategoriesList(),
        );
      case subCategoriesList:
        return CustomPageRoute(
          child: const SubCategoriesList(),
        );
      case filterHomeScreen:
        return CustomPageRoute(
          child: const FilterHomeScreen(),
        );
      case filterScreen:
        return CustomPageRoute(
          child: const FilterScreen(),
        );
      case createAdDetailScreen:
        return CustomPageRoute(
          child: const AdsDetailsScreen(),
        );
      case setAdsPriceScreen:
        return CustomPageRoute(
          child: const SetAdsPriceScreen(),
        );
      case setAdsLocationScreen:
        return CustomPageRoute(
          child: const SetAdsLocationScreen(),
        );
      case uploadMediaScreen:
        return CustomPageRoute(
          child: const UploadMediaScreen(),
        );
      case adsReviewContactScreen:
        return CustomPageRoute(
          child: const AdsReviewContactScreen(),
        );
      case emailConfirmationScreen:
        return CustomPageRoute(
          child: const EmailConfirmationScreen(),
        );
      case detailProgressScreen:
        return CustomPageRoute(
          child: const DetailProgressScreen(),
        );
      case successScreen:
        return CustomPageRoute(
          child: const SuccessScreen(),
        );
      case verifyScreen:
        return CustomPageRoute(
          child: const VerifyAccountScreen(),
        );
      case resetPasswordScreen:
        return CustomPageRoute(
          child: const ResetPasswordScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
