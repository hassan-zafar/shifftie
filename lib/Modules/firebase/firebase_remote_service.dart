import 'package:inspireui/utils/logs.dart';

import 'firebase_remote_config.dart';
import 'firebase_service.dart';

class FirebaseRemoteServices {
  static Future<FirebaseRemoteConfig?> loadRemoteConfig() async {
    final _remoteConfig = FirebaseServices().remoteConfig!;

    try {
      await _remoteConfig.fetch();
      await _remoteConfig.activate();
      return _remoteConfig;
    } catch (e) {
      printLog('Unable to fetch remote config. Default value will be used. $e');
    }
    return null;
  }
}
