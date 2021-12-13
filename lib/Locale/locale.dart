import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Locale/Languages/arabic.dart';
import 'package:shifftie/Locale/Languages/english.dart';
import 'package:shifftie/Locale/Languages/french.dart';
import 'package:shifftie/Locale/Languages/indonesian.dart';
import 'package:shifftie/Locale/Languages/italian.dart';
import 'package:shifftie/Locale/Languages/portuguese.dart';
import 'package:shifftie/Locale/Languages/spanish.dart';
import 'package:shifftie/Locale/Languages/swahili.dart';
import 'package:shifftie/Locale/Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'tr': turkish(),
    'it': italian(),
    'sw': swahili(),
  };

  String? get changeLanguage {
    return _localizedValues[locale.languageCode]!['changeLanguage'];
  }

  String? get youWillNeed {
    return _localizedValues[locale.languageCode]!['youWillNeed'];
  }

  String? get enterPhone {
    return _localizedValues[locale.languageCode]!['enterPhone'];
  }

  String? get continueText {
    return _localizedValues[locale.languageCode]!['continueText'];
  }

  String? get orContinueWith {
    return _localizedValues[locale.languageCode]!['orContinueWith'];
  }

  String? get signUpNow {
    return _localizedValues[locale.languageCode]!['signUpNow'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get email {
    return _localizedValues[locale.languageCode]!['email'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get weWillSend {
    return _localizedValues[locale.languageCode]!['weWillSend'];
  }

  String? get verification {
    return _localizedValues[locale.languageCode]!['verification'];
  }

  String? get enterCode {
    return _localizedValues[locale.languageCode]!['enterCode'];
  }

  String? get verificationCode {
    return _localizedValues[locale.languageCode]!['verificationCode'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get resend {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get following {
    return _localizedValues[locale.languageCode]!['following'];
  }

  String? get related {
    return _localizedValues[locale.languageCode]!['related'];
  }

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get explore {
    return _localizedValues[locale.languageCode]!['explore'];
  }

  String? get notification {
    return _localizedValues[locale.languageCode]!['notification'];
  }

  String? get profile {
    return _localizedValues[locale.languageCode]!['profile'];
  }

  String? get help {
    return _localizedValues[locale.languageCode]!['help'];
  }

  String? get howToCreateAccount {
    return _localizedValues[locale.languageCode]!['howToCreateAccount'];
  }

  String? get howToChangePassword {
    return _localizedValues[locale.languageCode]!['howToChangePassword'];
  }

  String? get howToPostVideo {
    return _localizedValues[locale.languageCode]!['howToPostVideo'];
  }

  String? get howToDeleteVideo {
    return _localizedValues[locale.languageCode]!['howToDeleteVideo'];
  }

  String? get howToChangeProfileInfo {
    return _localizedValues[locale.languageCode]!['howToChangeProfileInfo'];
  }

  String? get howCanIShare {
    return _localizedValues[locale.languageCode]!['howCanIShare'];
  }

  String? get tnc {
    return _localizedValues[locale.languageCode]!['tnc'];
  }

  String? get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'];
  }

  String? get comments {
    return _localizedValues[locale.languageCode]!['comments'];
  }

  String? get comment1 {
    return _localizedValues[locale.languageCode]!['comment1'];
  }

  String? get comment2 {
    return _localizedValues[locale.languageCode]!['comment2'];
  }

  String? get comment3 {
    return _localizedValues[locale.languageCode]!['comment3'];
  }

  String? get comment4 {
    return _localizedValues[locale.languageCode]!['comment4'];
  }

  String? get minAgo {
    return _localizedValues[locale.languageCode]!['minAgo'];
  }

  String? get dayAgo {
    return _localizedValues[locale.languageCode]!['dayAgo'];
  }

  String? get writeYourComment {
    return _localizedValues[locale.languageCode]!['writeYourComment'];
  }

  String? get search {
    return _localizedValues[locale.languageCode]!['search'];
  }

  String? get video {
    return _localizedValues[locale.languageCode]!['video'];
  }

  String? get viewAll {
    return _localizedValues[locale.languageCode]!['viewAll'];
  }

  String? get user {
    return _localizedValues[locale.languageCode]!['user'];
  }

  String? get commentOff {
    return _localizedValues[locale.languageCode]!['commentOff'];
  }

  String? get saveToGallery {
    return _localizedValues[locale.languageCode]!['saveToGallery'];
  }

  String? get selectCover {
    return _localizedValues[locale.languageCode]!['selectCover'];
  }

  String? get describeVideo {
    return _localizedValues[locale.languageCode]!['describeVideo'];
  }

  String? get post {
    return _localizedValues[locale.languageCode]!['post'];
  }

  String? get swipeUpForGallery {
    return _localizedValues[locale.languageCode]!['swipeUpForGallery'];
  }

  String? get addMusic {
    return _localizedValues[locale.languageCode]!['addMusic'];
  }

  String? get next {
    return _localizedValues[locale.languageCode]!['next'];
  }

  String? get follow {
    return _localizedValues[locale.languageCode]!['follow'];
  }

  String? get followers {
    return _localizedValues[locale.languageCode]!['followers'];
  }

  String? get users {
    return _localizedValues[locale.languageCode]!['users'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get comment5 {
    return _localizedValues[locale.languageCode]!['comment5'];
  }

  String? get editProfile {
    return _localizedValues[locale.languageCode]!['editProfile'];
  }

  String? get liked {
    return _localizedValues[locale.languageCode]!['liked'];
  }

  String? get delete {
    return _localizedValues[locale.languageCode]!['delete'];
  }

  String? get changeProfilePic {
    return _localizedValues[locale.languageCode]!['changeProfilePic'];
  }

  String? get save {
    return _localizedValues[locale.languageCode]!['save'];
  }

  String? get profileInfo {
    return _localizedValues[locale.languageCode]!['profileInfo'];
  }

  String? get accountInfo {
    return _localizedValues[locale.languageCode]!['accountInfo'];
  }

  String? get bio {
    return _localizedValues[locale.languageCode]!['bio'];
  }

  String? get instagramID {
    return _localizedValues[locale.languageCode]!['instagramID'];
  }

  String? get facebookID {
    return _localizedValues[locale.languageCode]!['facebookID'];
  }

  String? get twitterID {
    return _localizedValues[locale.languageCode]!['twitterID'];
  }

  String? get comment6 {
    return _localizedValues[locale.languageCode]!['comment6'];
  }

  String? get comment7 {
    return _localizedValues[locale.languageCode]!['comment7'];
  }

  String? get message {
    return _localizedValues[locale.languageCode]!['message'];
  }

  String? get messages {
    return _localizedValues[locale.languageCode]!['messages'];
  }

  String? get notifications {
    return _localizedValues[locale.languageCode]!['notifications'];
  }

  String? get comment8 {
    return _localizedValues[locale.languageCode]!['comment8'];
  }

  String? get seeMore {
    return _localizedValues[locale.languageCode]!['seeMore'];
  }

  String? get postVideo {
    return _localizedValues[locale.languageCode]!['postVideo'];
  }

  String? get likedYourVideo {
    return _localizedValues[locale.languageCode]!['likedYourVideo'];
  }

  String? get heyILikeYourVideos {
    return _localizedValues[locale.languageCode]!['heyILikeYourVideos'];
  }

  String? get danceLike {
    return _localizedValues[locale.languageCode]!['danceLike'];
  }

  String? get laughOut {
    return _localizedValues[locale.languageCode]!['laughOut'];
  }

  String? get followUr {
    return _localizedValues[locale.languageCode]!['followUr'];
  }

  String? get commentedOnYour {
    return _localizedValues[locale.languageCode]!['commentedOnYour'];
  }

  String? get startedFollowing {
    return _localizedValues[locale.languageCode]!['startedFollowing'];
  }

  String? get yesIUse {
    return _localizedValues[locale.languageCode]!['yesIUse'];
  }

  String? get noWorries {
    return _localizedValues[locale.languageCode]!['noWorries'];
  }

  String? get ohThank {
    return _localizedValues[locale.languageCode]!['ohThank'];
  }

  String? get alreadyLikedIt {
    return _localizedValues[locale.languageCode]!['alreadyLikedIt'];
  }

  String? get report {
    return _localizedValues[locale.languageCode]!['report'];
  }

  String? get block {
    return _localizedValues[locale.languageCode]!['block'];
  }

  String? get facebookAccount {
    return _localizedValues[locale.languageCode]!['facebookAccount'];
  }

  String? get googleAccount {
    return _localizedValues[locale.languageCode]!['googleAccount'];
  }

  String? get sec {
    return _localizedValues[locale.languageCode]!['sec'];
  }

  String? get comment9 {
    return _localizedValues[locale.languageCode]!['comment9'];
  }

  String? get comment10 {
    return _localizedValues[locale.languageCode]!['comment10'];
  }

  String? get comment11 {
    return _localizedValues[locale.languageCode]!['comment11'];
  }

  String? get comment12 {
    return _localizedValues[locale.languageCode]!['comment12'];
  }

  String? get comment13 {
    return _localizedValues[locale.languageCode]!['comment13'];
  }

  String? get comment14 {
    return _localizedValues[locale.languageCode]!['comment14'];
  }

  String? get verifiedBadgeRequest {
    return _localizedValues[locale.languageCode]!['verifiedBadgeRequest'];
  }

  String? get provide {
    return _localizedValues[locale.languageCode]!['provide'];
  }

  String? get clickNow {
    return _localizedValues[locale.languageCode]!['clickNow'];
  }

  String? get uploadGovt {
    return _localizedValues[locale.languageCode]!['uploadGovt'];
  }

  String? get uploadNow {
    return _localizedValues[locale.languageCode]!['uploadNow'];
  }

  String? get requestFor {
    return _localizedValues[locale.languageCode]!['requestFor'];
  }

  String? get itWillTake {
    return _localizedValues[locale.languageCode]!['itWillTake'];
  }

  String? get getVerified {
    return _localizedValues[locale.languageCode]!['getVerified'];
  }

  String? get clickCurrent {
    return _localizedValues[locale.languageCode]!['clickCurrent'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
        'id',
        'pt',
        'fr',
        'es',
        'tr',
        'it',
        'sw'
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
