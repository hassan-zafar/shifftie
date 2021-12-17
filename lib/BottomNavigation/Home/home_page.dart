import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Home/following_tab.dart';
import 'package:shifftie/BottomNavigation/Home/home_new_user_page.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';

List<String> videos1 = [
  'assets/videos/3.mp4',
  'assets/videos/1.mp4',
  'assets/videos/2.mp4',
];

List<String> videos2 = [
  'assets/videos/4.mp4',
  'assets/videos/5.mp4',
  'assets/videos/6.mp4',
];

List<String> imagesInDisc1 = [
  'assets/user/user1.png',
  'assets/user/user2.png',
  'assets/user/user3.png',
];

List<String> imagesInDisc2 = [
  'assets/user/user4.png',
  'assets/user/user3.png',
  'assets/user/user1.png',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      const Tab(text: 'Following'),
      const Tab(text: '|      Trending'),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Stack(
        children: <Widget>[
          TabBarView(
            children: <Widget>[
              FollowingTabPage(videos1, imagesInDisc1, false),
              HomeNewUserFollowPage(
                  // videos2, imagesInDisc2, true
                  ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: MediaQuery.of(context).size.width * 0.18,
                    child: TabBar(
                      isScrollable: true,
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      indicator: BoxDecoration(color: transparentColor),
                      tabs: tabs,
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 14,
                    start: 84,
                    child: CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
