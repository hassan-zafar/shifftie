import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Explore/explore_page.dart';
import 'package:shifftie/BottomNavigation/Home/home_page.dart';
import 'package:shifftie/BottomNavigation/MyProfile/my_profile_page.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/BottomNavigation/Notifications/notification_messages.dart';
import 'package:shifftie/Shifts/shifts_follow_screen.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Theme/style.dart';
import 'package:shifftie/main.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const ExplorePage(),
    Container(),
    const ShiftYouFollowScreen(),
    const NotificationMessages(),
    const MyProfilePage(),
  ];

  void onTap(int index) {
    if (index == 2) {
      Navigator.pushNamed(context, PageRoutes.addVideoPage);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<BottomNavigationBarItem> _bottomBarItems = [
      BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage('assets/icons/ic_home.png')),
        activeIcon:
            const ImageIcon(AssetImage('assets/icons/ic_homeactive.png')),
        label: locale.home,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage('assets/icons/ic_explore.png')),
        activeIcon:
            const ImageIcon(AssetImage('assets/icons/ic_exploreactive.png')),
        label: locale.explore,
      ),
      BottomNavigationBarItem(
        icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            decoration: BoxDecoration(
              borderRadius: radius,
              color: mainColor,
            ),
            child: const Icon(Icons.add)),
        label: ' ',
      ),
      BottomNavigationBarItem(
        icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            decoration: BoxDecoration(
              borderRadius: radius,
              color: mainColor,
            ),
            child: const Icon(Icons.data_saver_off)),
        label: ' ',
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage('assets/icons/ic_notification.png')),
        activeIcon: const ImageIcon(
            AssetImage('assets/icons/ic_notificationactive.png')),
        label: locale.notification,
      ),
      BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage('assets/icons/ic_profile.png')),
        activeIcon:
            const ImageIcon(AssetImage('assets/icons/ic_profileactive.png')),
        label: locale.profile,
      ),
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: transparentColor,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              iconSize: 22.0,
              selectedItemColor: secondaryColor,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              unselectedItemColor: secondaryColor,
              items: _bottomBarItems,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
