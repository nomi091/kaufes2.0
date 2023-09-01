

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/custom_models/language_model.dart';
import '../../utils/constants/image_paths.dart';

class LanguageViewModel with ChangeNotifier {
  Locale _selectedLocale = const Locale('en', 'US'); // Default locale
  bool _isSelected = false; // Default selection state
  List<LanguageInfoModel> countries = [
    LanguageInfoModel(
        flag: AppImages.germanyFlag,
        isSelected: false,
        name: 'Deutsch',
    locale: const Locale('de', 'DE'),
        
        ),
    LanguageInfoModel(
        flag: AppImages.englishFlag,
        name: 'English',
        isSelected: false,
       locale: const Locale('en', 'US'),),
    LanguageInfoModel(
        flag: AppImages.itlyFlag,
        name: 'Italian',
        isSelected: false,
        locale: const Locale('it', 'IT')),
    LanguageInfoModel(
        flag: AppImages.franceFlag,
        name: 'French',
        isSelected: false,
        locale: const Locale('fr', 'FR')),
  ];
  Locale get selectedLocale => _selectedLocale;
  bool get isSelected => _isSelected;

  Future<void> setLocale(Locale locale) async {
    if (_selectedLocale != locale) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedLanguage', locale.languageCode);
      _selectedLocale = locale;
      _isSelected = true;
      notifyListeners();
    }
  }

  Future<void> loadSelectedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedLanguage = prefs.getString('selectedLanguage');
    if (selectedLanguage != null) {
      _selectedLocale = Locale(selectedLanguage);
      _isSelected = true;
      notifyListeners();
    }
  }
}
