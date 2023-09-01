import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../view_model/auth_view_model/auth_view_model.dart';
import '../../view_model/home_view_model/category_view_model.dart';
import '../../view_model/home_view_model/favourite_view_model.dart';
import '../view_model/account_view_model/account_view_model.dart';
import '../view_model/auth_view_model/complete_signup_profil_view_model.dart';
import '../view_model/general_items_view_model/general_view_model.dart';
import '../view_model/language_view_model/language_view_model.dart';
import '../view_model/notification_view_model/notification_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ChangeNotifierProvider(create: (_) => SignUpProfileViewModel()),
    ChangeNotifierProvider(create: (_) => CategoryViewModel()),
    //ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ChangeNotifierProvider(create: (_) => FavouriteViewModel()),
    ChangeNotifierProvider(create: (_) => NotificationViewModel()),
    ChangeNotifierProvider(create: (_) => AccountViewModel()),
    ChangeNotifierProvider(create: (_) => LanguageViewModel()),
    ChangeNotifierProvider(create: (_) => GeneralViewModel()),
  ];
}
