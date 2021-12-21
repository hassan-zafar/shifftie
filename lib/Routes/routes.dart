import 'package:flutter/material.dart';
import 'package:shifftie/Auth/login_navigator.dart';
import 'package:shifftie/BottomNavigation/Explore/more_page.dart';
import 'package:shifftie/BottomNavigation/MyProfile/badge_request.dart';
import 'package:shifftie/BottomNavigation/MyProfile/language_page.dart';
import 'package:shifftie/BottomNavigation/MyProfile/video_option.dart';
import 'package:shifftie/BottomNavigation/bottom_navigation.dart';
import 'package:shifftie/BottomNavigation/AddVideo/add_video.dart';
import 'package:shifftie/BottomNavigation/AddVideo/add_video_filter.dart';
import 'package:shifftie/BottomNavigation/MyProfile/followers.dart';
import 'package:shifftie/BottomNavigation/MyProfile/help_page.dart';
import 'package:shifftie/BottomNavigation/AddVideo/post_info.dart';
import 'package:shifftie/BottomNavigation/Explore/search_users.dart';
import 'package:shifftie/BottomNavigation/MyProfile/tnc.dart';
import 'package:shifftie/Screens/Chat/chat_page.dart';
import 'package:shifftie/Screens/user_profile.dart';

class PageRoutes {
  static const String loginNavigator = 'login_navigator';
  static const String bottomNavigation = 'bottom_navigation';
  static const String followersPage = 'followers_page';
  static const String helpPage = 'help_page';
  static const String tncPage = 'tnc_page';
  static const String searchPage = 'search_page';
  static const String addVideoPage = 'add_video_page';
  static const String addVideoFilterPage = 'add_video_filter_page';
  static const String postInfoPage = 'post_info_page';
  static const String userProfilePage = 'user_profile_page';
  static const String chatPage = 'chat_page';
  static const String morePage = 'more_page';
  static const String videoOptionPage = 'video_option_page';
  static const String verifiedBadgePage = 'verified_badge_page';
  static const String languagePage = 'language_page';

  Map<String, WidgetBuilder> routes() {
    return {
      loginNavigator: (context) => const LoginNavigator(),
      bottomNavigation: (context) => const BottomNavigation(),
      followersPage: (context) => const FollowersPage(),
      helpPage: (context) => const HelpPage(),
      tncPage: (context) => const TnC(),
      searchPage: (context) => const SearchUsers(),
      addVideoPage: (context) => const AddVideo(),
      addVideoFilterPage: (context) => const AddVideoFilter(),
      postInfoPage: (context) => const PostInfo(),
      userProfilePage: (context) => const UserProfilePage(),
      chatPage: (context) => const ChatPage(),
      morePage: (context) => const MorePage(),
      videoOptionPage: (context) => const VideoOptionPage(),
      verifiedBadgePage: (context) => const BadgeRequest(),
      languagePage: (context) => const ChangeLanguagePage(),
    };
  }
}
