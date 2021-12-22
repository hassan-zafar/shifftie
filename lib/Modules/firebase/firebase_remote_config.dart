import 'package:firebase_remote_config/firebase_remote_config.dart';
import '../../services/base_remote_config.dart';

class FirebaseRemoteConfig implements BaseRemoteConfig {
  final RemoteConfig _remoteConfig;

  FirebaseRemoteConfig(this._remoteConfig);

  @override
  Future<void> activate() {
    return _remoteConfig.activate();
  }

  @override
  Future<void> fetch() {
    return _remoteConfig.fetch();
  }

  @override
  String getString(String key) {
    return _remoteConfig.getString(key);
  }
}
