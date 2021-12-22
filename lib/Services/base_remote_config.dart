class BaseRemoteConfig {
  Future<void> fetch() async {}
  Future<void> activate() async {}

  String getString(String key) => '';
}
