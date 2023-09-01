import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/routes/routes.dart';

import '../../model/custom_models/account_list_items.dart';
import '../../model/custom_models/address_details_model.dart';
import '../../model/custom_models/country_info_model.dart';
import '../../model/custom_models/login_security_items.dart';
import '../../model/custom_models/notifications_model.dart';
import '../../utils/constants/image_paths.dart';

class AccountViewModel extends ChangeNotifier {
  final List<ContainerItem> accountItems = [
    ContainerItem(
        iconPath: AppImages.personalDetailsIcon,
        text: 'Personal Details',
        route: ScreenRoutes.personalDetailsScreen,
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.loginSecurityIcon,
        text: 'Login and Security',
        route: ScreenRoutes.loginSecurityScreen,
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.addressDetailsIcon,
        text: 'Address Details',
        route: ScreenRoutes.addressDetailsScreen,
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.paymentsIcon,
        text: 'Payments',
        route: '/settings',
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.notificationsIcon,
        text: 'Notifications',
        route: ScreenRoutes.notificationScreen,
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.languageIcon,
        text: 'Language',
        route:  ScreenRoutes.languageScreen,
        icon: Icons.arrow_forward_ios_rounded),
    // Add more items here
  ];
  final List<ContainerItem> generalItems = [
    ContainerItem(
        iconPath: AppImages.helpSupportIcon,
        text: 'Help & Support',
        route: ScreenRoutes.helpSupportScreen,
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.privacyIcon,
        text: 'Privacy Policy',
        route: ScreenRoutes.customDialougeScreen,
        icon: Icons.ios_share_outlined),
    ContainerItem(
        iconPath: AppImages.blogIcon,
        text: 'Our Blogs',
        route: ScreenRoutes.customDialougeScreen,
        icon: Icons.ios_share_outlined),
    ContainerItem(
        iconPath: AppImages.logOutIcon,
        text: 'Logout',
        route: ScreenRoutes.loginSecurityScreen,
        icon: Icons.arrow_forward_ios_rounded),
    // Add more items here
  ];

  final List<ContainerItem> commecialPoints = [
    ContainerItem(
        iconPath: AppImages.helpSupportIcon,
        text: 'Place free 10 ads',
        route: '/home',
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.privacyIcon,
        text: 'Free Registration',
        route: '/settings',
        icon: Icons.arrow_forward_ios_rounded),
    ContainerItem(
        iconPath: AppImages.blogIcon,
        text: '3% Commission per sale',
        route: '/settings',
        icon: Icons.ios_share_outlined),
    ContainerItem(
        iconPath: AppImages.logOutIcon,
        text: '24/7 Live Support',
        route: '/settings',
        icon: Icons.ios_share_outlined),
    ContainerItem(
        iconPath: AppImages.logOutIcon,
        text: 'Place unlimited Ads',
        route: '/settings',
        icon: Icons.ios_share_outlined),
    // Add more items here
  ];
  final List<LoginSecurityItems> loginSecurityItems = [
    LoginSecurityItems(
        text: 'User Name', text2: 'Edit', title: 'Rahal123', value: false),
    LoginSecurityItems(
        text: 'Password', text2: 'Reset', title: '**********', value: false),
    LoginSecurityItems(
        text: 'Phone Number', text2: 'Add', title: 'Not Added', value: false),

    // Add more items here
  ];
  final List<AddressDetailModel> addressitems = [
    AddressDetailModel(
        text: 'Primary Address',
        text2: 'Edit',
        title:
            'Aeschistrasse 13, 3362 Niederönz, BE, CH Aeschistrasse 13, 3362 Niederönz, BE, CH',
        value: false),
    AddressDetailModel(
        text: 'Address 2',
        text2: 'Edit',
        title: 'Aeschistrasse 13, 3362 Niederönz, BE, CH',
        value: false),
    AddressDetailModel(
        text: 'Address 3', text2: 'Add', title: 'Not Added', value: false),
    AddressDetailModel(
        text: 'Billing Address',
        text2: 'Add',
        title: 'Aeschistrasse 13, 3362 Niederönz, BE, CH',
        value: false),
  ];
  final List<AddressDetailtextFieldModel> addressTextFieldItems = [
    AddressDetailtextFieldModel(
      text: 'Street Address',
      title: 'Aeschistrasse',
    ),
    AddressDetailtextFieldModel(
      text: 'Hausnummer',
      title: '13',
    ),
    AddressDetailtextFieldModel(
      text: 'Adresszusatz (Optional)',
      title: 'Adresszusatz',
    ),
    AddressDetailtextFieldModel(
      text: 'Postfach (Optional)',
      title: 'Postfach',
    ),
    AddressDetailtextFieldModel(
      text: 'Plz',
      title: '3362',
    ),
  ];
  final List<NotificationsItemsModel> notificationsItems = [
    NotificationsItemsModel(
        iconPath: AppImages.pushNotificationsIcon,
        text: 'Push Notifications',
        text2: 'dummy_text',
        route: ScreenRoutes.secondNotificationScreen,
        icon: Icons.arrow_forward_ios_rounded),
    NotificationsItemsModel(
        iconPath: AppImages.emailNotificationsIcon,
        text: 'Email Notifications',
        text2: 'dummy_text',
        route: ScreenRoutes.secondNotificationScreen,
        icon: Icons.arrow_forward_ios_rounded),
    NotificationsItemsModel(
        iconPath: AppImages.newsLetterNotificationsIcon,
        text: 'Kaufes Newsletters',
        text2: 'dummy_text',
        route: ScreenRoutes.secondNotificationScreen,
        icon: Icons.arrow_forward_ios_rounded),
  ];
  final List<NotificationsItemsModel> pushNotificationsItems = [
    NotificationsItemsModel(
        iconPath: AppImages.pushNotificationsIcon,
        text: 'Buying Notifications',
        text2: 'dummy_text',
        route: ScreenRoutes.togleNotficationsScreen,
        icon: Icons.arrow_forward_ios_rounded),
    NotificationsItemsModel(
        iconPath: AppImages.emailNotificationsIcon,
        text: 'Selling Notifications',
        text2: 'dummy_text',
        route: ScreenRoutes.togleNotficationsScreen,
        icon: Icons.arrow_forward_ios_rounded),
    NotificationsItemsModel(
        iconPath: AppImages.newsLetterNotificationsIcon,
        text: 'Favourite Notifications',
        text2: 'dummy_text',
        route: ScreenRoutes.togleNotficationsScreen,
        icon: Icons.arrow_forward_ios_rounded),
  ];

  bool anyItemTrue() {
    for (var item in loginSecurityItems) {
      if (item.value) {
        return true;
      }
    }
    return false;
  }

  bool anyAddresItemTrue() {
    for (var item in addressitems) {
      if (item.value) {
        return true;
      }
    }
    return false;
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController firmaNumberController = TextEditingController();
  TextEditingController websiteLinkController = TextEditingController();
  TextEditingController texationNumberController = TextEditingController();
//personal details Controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoenNumberController = TextEditingController();
  final List<String> items = ['Mr', 'Ms', 'None'];
  String dropdownValue = 'Mr';
  List<CountryInfo> countryInfos = [
    CountryInfo('🇩🇪', '+49'),
    CountryInfo('🇮🇹', '+39'),
    CountryInfo('🇨🇭', '+41'),
    CountryInfo('🇵🇰', '+92'),
    CountryInfo('🇦🇹', '+43'),
  ];
  DateTime selectedDate = DateTime(1999);
  CountryInfo? selectedCountry;
  String code = "+49";
  bool salutation = false;
  bool fullName = false;
  bool dob = false;
  bool userName = false;
  bool password = false;
  bool phoneNumber = false;
  bool isOtp = false;
  openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      dateController.text = picked.toString().substring(0, 10);
    }
  }
}
