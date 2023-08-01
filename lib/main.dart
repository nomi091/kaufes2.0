import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kaufes/res/provider/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      path: "assets/translations",
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // home: const ResetPasswordScreen(),
        initialRoute: ScreenRoutes.splash,
        onGenerateRoute: ScreenRoutes.generateRoute,
      ),
    );
  }
}
