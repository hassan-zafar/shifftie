import 'package:flutter/cupertino.dart';
import 'package:shifftie/Models/users.dart';

import 'base_remote_config.dart';

class BaseFirebaseServices {
  /// check if the Firebase is enable or not
  bool get isEnabled => false;

  Future<void> init() async {}

  dynamic getCloudMessaging() {}

  dynamic getCurrentUser() => null;

  /// Login Firebase with social account
  void loginFirebaseApple({authorizationCode, identityToken}) {}

  void loginFirebaseFacebook({token}) {}

  void loginFirebaseGoogle({token}) {}

  void loginFirebaseEmail({email, password}) {}

  dynamic loginFirebaseCredential({credential}) {}

  dynamic getFirebaseCredential({verificationId, smsCode}) {}

  /// save user to firebase
  void saveUserToFirestore({user}) {}

  /// verify SMS login
  dynamic getFirebaseStream() {}

  void verifyPhoneNumber(
      {phoneNumber,
      codeAutoRetrievalTimeout,
      codeSent,
      verificationCompleted,
      verificationFailed}) {}

  /// render Chat Screen
  Widget renderListChatScreen() => Container();

  Widget renderVendorListChatScreen({AppUserModel? user}) => Container();

  Widget renderChatScreen({senderUser, receiverEmail, receiverName}) =>
      Container();

  /// load firebase remote config
  Future<BaseRemoteConfig?> loadRemoteConfig() async => null;

  /// init Firebase Dynamic link
  void initDynamicLinkService(context) {}

  void shareDynamicLinkProduct({context, itemUrl}) {}

  /// register new user with email and password
  void createUserWithEmailAndPassword({email, password}) {}

  void signOut() {}

  Future<String?> getMessagingToken() async => '';

  List<NavigatorObserver> getMNavigatorObservers() =>
      const <NavigatorObserver>[];
}
