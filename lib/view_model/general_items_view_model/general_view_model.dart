import 'package:flutter/material.dart';

import '../../model/custom_models/country_info_model.dart';
import '../../model/custom_models/notifications_model.dart';
import '../../utils/constants/image_paths.dart';
import '../../utils/routes/routes.dart';

class GeneralViewModel extends ChangeNotifier {
  final List<NotificationsItemsModel> helpSupportItems = [
    NotificationsItemsModel(
        iconPath: AppImages.helpCenterIcon,
        text: 'Open Help Center',
        text2: 'dummy_text',
        route: ScreenRoutes.customDialougeScreen,
        icon: Icons.ios_share_outlined),
    NotificationsItemsModel(
        iconPath: AppImages.requestSubmitIcon,
        text: 'Submit Request',
        text2: 'dummy_text',
        route: ScreenRoutes.submitRequestScreen,
        icon: Icons.arrow_forward_ios_rounded),
    NotificationsItemsModel(
        iconPath: AppImages.sendEmailIcon,
        text: 'Send us Email',
        text2: 'dummy_text',
        route: ScreenRoutes.customDialougeScreen,
        icon: Icons.ios_share_outlined),
  ];
  bool showOtpField = false;
  final FocusNode phoneFocusNode = FocusNode();
  TextEditingController supportNameController = TextEditingController();
  TextEditingController supportEmailController = TextEditingController();
  TextEditingController supportPhoneController = TextEditingController();
  TextEditingController supportMessageController = TextEditingController();
  String dropdownvalue = "";
// List of items in our dropdown menu
  List<CountryInfo> countryInfos = [
    CountryInfo('🇩🇪', '+49'),
    CountryInfo('🇮🇹', '+39'),
    CountryInfo('🇨🇭', '+41'),
    CountryInfo('🇵🇰', '+92'),
    CountryInfo('🇦🇹', '+43'),
  ];
  String code = "+49";

  CountryInfo? selectedCountry;
}
