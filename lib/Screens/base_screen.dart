import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/config.dart';
import '../models/app_model.dart';
import '../services/index.dart';

abstract class BaseScreen<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();

    /// Load app config on every single page if the appConfig is not init
    if (kIsWeb) {
      Future.delayed(Duration.zero, () async {
        var appModel = Provider.of<AppModel>(context, listen: false);
        if (appModel.appConfig == null) {
          // ignore: avoid_print
          print('[BaseScreen] ☪️ Init App Config ☪️ ');

          /// set the server config at first loading
          Services().setAppConfig(serverConfig);
          await appModel.loadAppConfig();
        }
      });
    }

    WidgetsBinding.instance!
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  void afterFirstLayout(BuildContext context) {}

  /// Get size screen
  Size get screenSize => MediaQuery.of(context).size;
}
