import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
  ThemeConfig get themeConfig => darkTheme ? kDarkConfig : kLightConfig;
  String get mainColor =>
      themeConfig.mainColor ?? appConfig!.settings.mainColor;

  /// Product and Category Layout setting
  List<String>? categories;
  Map? categoriesIcons;
  String categoryLayout = '';
  String get productListLayout => appConfig!.settings.productListLayout;
  double get ratioProductImage =>
      appConfig!.settings.ratioProductImage ??
      kAdvanceConfig['RatioProductImage'];
  String get productDetailLayout =>
      appConfig!.settings.productDetail ?? kProductDetail.layout;
  kBlogLayout get blogDetailLayout => appConfig!.settings.blogDetail != null
      ? EnumToString.fromString(
          kBlogLayout.values, appConfig!.settings.blogDetail!)
      : kAdvanceConfig['DetailedBlogLayout'];

  /// App Model Constructor
  AppModel([String? lang]) {
    _langCode = lang ?? kAdvanceConfig['DefaultLanguage'];
    advertisement = AdvertisementConfig.fromJson(adConfig: kAdConfig);
    vendorType = kFluxStoreMV.contains(serverConfig['type'])
        ? VendorType.multi
        : VendorType.single;
  }

  void _updateAndSaveDefaultLanguage(String? lang) async {
    var prefs = injector<SharedPreferences>();
    _langCode = prefs.getString('language') != null &&
            prefs.getString('language')!.isNotEmpty
        ? prefs.getString('language')
        : lang ?? kAdvanceConfig['DefaultLanguage'];
    await prefs.setString(
        'language', _langCode!.split('-').first.toLowerCase());
  }

  /// Get persist config from Share Preference
  Future<bool> getPrefConfig({String? lang}) async {
    try {
      _updateAndSaveDefaultLanguage(lang);

      var prefs = injector<SharedPreferences>();
      var defaultCurrency = kAdvanceConfig['DefaultCurrency'] as Map;

      darkTheme = prefs.getBool('darkTheme') ?? kDefaultDarkTheme;
      currency = prefs.getString('currency') ?? defaultCurrency['currency'];
      currencyCode =
          prefs.getString('currencyCode') ?? defaultCurrency['currencyCode'];
      smallestUnitRate = defaultCurrency['smallestUnitRate'];
      isInit = true;
      await updateTheme(darkTheme);

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> changeLanguage(
      String? languageCode, BuildContext context) async {
    try {
      _langCode = languageCode;
      var prefs = injector<SharedPreferences>();
      await prefs.setString('language', _langCode!);

      await loadAppConfig(isSwitched: true);
      await loadCurrency();
      eventBus.fire(const EventChangeLanguage());

      await Provider.of<CategoryModel>(context, listen: false)
          .getCategories(lang: languageCode, sortingList: categories);

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<void> changeCurrency(String? item, BuildContext context,
      {String? code}) async {
    try {
      Provider.of<CartModel>(context, listen: false).changeCurrency(item);
      var prefs = injector<SharedPreferences>();
      currency = item;
      currencyCode = code;
      await prefs.setString('currencyCode', currencyCode!);
      await prefs.setString('currency', currency!);
      notifyListeners();
    } catch (error) {
      printLog('[changeCurrency] error: ${error.toString()}');
    }
  }

  Future<void> updateTheme(bool theme) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      darkTheme = theme;
      await prefs.setBool('darkTheme', theme);
      notifyListeners();
    } catch (error) {
      printLog('[updateTheme] error: ${error.toString()}');
    }
  }

  void loadStreamConfig(config) {
    appConfig = AppConfig.fromJson(config);
    isLoading = false;
    notifyListeners();
  }

  Future<AppConfig?> loadAppConfig(
      {isSwitched = false, Map<String, dynamic>? config}) async {
    var startTime = DateTime.now();
    _langCode = _langCode == '' ? kAdvanceConfig['DefaultLanguage'] : _langCode;

    try {
      if (!isInit || _langCode!.isEmpty) {
        await getPrefConfig();
      }

      if (config != null) {
        appConfig = AppConfig.fromJson(config);
      } else {
        var loadAppConfigDone = false;

        /// load config from Notion
        if (Config().type == ConfigType.notion) {
          final appCfg =
              await Services().widget.onGetAppConfig(langCode ?? 'en');

          if (appCfg != null) {
            appConfig = appCfg;
            loadAppConfigDone = true;
          }
        }

        if (loadAppConfigDone == false) {
          /// we only apply the http config if isUpdated = false, not using switching language
          // ignore: prefer_contains
          if (kAppConfig.indexOf('http') != -1) {
            // load on cloud config and update on air
            var path = kAppConfig;
            if (path.contains('.json')) {
              path = path.substring(0, path.lastIndexOf('/'));
              path += '/config_$langCode.json';
            }
            final appJson = await httpGet(Uri.encodeFull(path).toUri()!,
                headers: {'Accept': 'application/json'});
            appConfig = AppConfig.fromJson(
                convert.jsonDecode(convert.utf8.decode(appJson.bodyBytes)));
          } else {
            // load local config
            var path = 'lib/config/config_$langCode.json';
            try {
              final appJson = await rootBundle.loadString(path);
              appConfig = AppConfig.fromJson(convert.jsonDecode(appJson));
            } catch (e) {
              final appJson = await rootBundle.loadString(kAppConfig);
              appConfig = AppConfig.fromJson(convert.jsonDecode(appJson));
            }
          }
        }
      }

      /// Load categories config for the Tabbar menu
      /// User to sort the category Setting
      var categoryTab = List.from(appConfig!.tabBar).firstWhere(
          (e) => e.layout == 'category' || e.layout == 'vendors',
          orElse: () => null);
      if (categoryTab != null) {
        if (categoryTab.categories != null) {
          categories = List<String>.from(categoryTab.categories ?? []);
        }
        if (categoryTab.images != null) {
          categoriesIcons =
              categoryTab.images is Map ? Map.from(categoryTab.images) : null;
        }
        categoryLayout = categoryTab.categoryLayout;
      }

      /// apply App Caching if isCaching is enable
      /// not use for Fluxbuilder
      if (!Config().isBuilder) {
        await Services().widget.onLoadedAppConfig(langCode, (configCache) {
          appConfig = AppConfig.fromJson(configCache);
        });
      }

      isLoading = false;

      notifyListeners();
      printLog('[Debug] Finish Load AppConfig', startTime);
      return appConfig;
    } catch (err, trace) {
      printLog('🔴 AppConfig JSON loading error');
      printLog(err);
      printLog(trace);
      isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<void> loadCurrency() async {
    /// Load the Rate for Product Currency
    final rates = await Services().api.getCurrencyRate();
    if (rates != null) {
      currencyRate = rates;
    }
  }

  void updateProductListLayout(layout) {
    appConfig!.settings =
        appConfig!.settings.copyWith(productListLayout: layout);
    notifyListeners();
  }

  void raiseNotify() {
    notifyListeners();
  }
}
