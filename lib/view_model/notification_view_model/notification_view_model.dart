import 'package:flutter/material.dart';

import '../../model/custom_models/notifications_model.dart';
import '../../utils/constants/image_paths.dart';
import '../../utils/routes/routes.dart';

class NotificationViewModel extends ChangeNotifier {
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
  final List<NotificationsItemsModel> helpSupportItems = [
    NotificationsItemsModel(
        iconPath: AppImages.helpCenterIcon,
        text: 'Open Help Center',
        text2: 'dummy_text',
        route: ScreenRoutes.secondNotificationScreen,
        icon: Icons.arrow_forward_ios_rounded),
    NotificationsItemsModel(
        iconPath: AppImages.requestSubmitIcon,
        text: 'Submit Request',
        text2: 'dummy_text',
        route: ScreenRoutes.secondNotificationScreen,
        icon: Icons.arrow_forward_ios_rounded),
    NotificationsItemsModel(
        iconPath: AppImages.sendEmailIcon,
        text: 'Send us Email',
        text2: 'dummy_text',
        route: ScreenRoutes.secondNotificationScreen,
        icon: Icons.arrow_forward_ios_rounded),
  ];
 
  bool mainToggle = false;
  List<ToggleNotificationItemsModel> buyingNotifications = [
    ToggleNotificationItemsModel(text: 'Überboten', toggle: false),
    ToggleNotificationItemsModel(text: 'Auktion nicht gewonnen', toggle: false),
    ToggleNotificationItemsModel(text: 'Artikel bei dem du mitgeboten hast läuft nur noch 24 Stunden', toggle: false),
    ToggleNotificationItemsModel(text: 'System gibt aufgrund deines maximalen Gebotes automatisch ein Gebot ab', toggle: false),
    ToggleNotificationItemsModel(text: 'Zweite Chance', toggle: false),
    ToggleNotificationItemsModel(text: 'Preisreduktion', toggle: false),
    ToggleNotificationItemsModel(text: 'Der Verkäufer hat den Artikel versendet', toggle: false),
 ]; // 5 toggle buttons for example
}
