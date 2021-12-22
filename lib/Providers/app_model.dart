import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shifftie/Models/theme_config.dart';

// import '../common/config.dart';
// import '../common/config/models/index.dart';
// import '../common/constants.dart';
// import '../modules/dynamic_layout/config/app_config.dart';
// import '../services/index.dart';
// import 'advertisement/index.dart' show AdvertisementConfig;
// import 'cart/cart_model.dart';
// import 'category_model.dart';

class AppModel with ChangeNotifier {
  Map? deeplink;

  /// Loading State setting
  bool isLoading = true;
  bool isInit = false;

  /// Theming values for light or dark theme mode
  ThemeMode? themeMode;
  bool get darkTheme => themeMode == ThemeMode.dark;
  set darkTheme(bool value) =>
      themeMode = value ? ThemeMode.dark : ThemeMode.light;
  // ThemeConfig get themeConfig => darkTheme ? kDarkConfig : kLightConfig;

  /// Get persist config from Share Preference
  Future<bool> getPrefConfig({String? lang}) async {
    try {
      var prefs = GetStorage();

      // darkTheme = prefs.read('darkTheme') ?? kDefaultDarkTheme;

      isInit = true;
      await updateTheme(darkTheme);

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<void> updateTheme(bool theme) async {
    try {
      var prefs = GetStorage();
      darkTheme = theme;
      await prefs.write('darkTheme', theme);
      notifyListeners();
    } catch (error) {
      print('[updateTheme] error: ${error.toString()}');
    }
  }

  void raiseNotify() {
    notifyListeners();
  }
}
