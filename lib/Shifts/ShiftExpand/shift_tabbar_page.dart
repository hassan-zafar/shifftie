import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Explore/explore_page.dart';
import 'package:shifftie/Shifts/ShiftExpand/shift_details.dart';
import 'package:shifftie/Theme/colors.dart';

class ShiftTabBarPage extends StatefulWidget {
  const ShiftTabBarPage({Key? key}) : super(key: key);

  @override
  _ShiftTabBarPageState createState() => _ShiftTabBarPageState();
}

class _ShiftTabBarPageState extends State<ShiftTabBarPage> {
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      const Tab(text: 'Details'),
      const Tab(text: 'Vote'),
      const Tab(text: 'Comment'),
    ];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: Stack(
          children: <Widget>[
            const TabBarView(
              children: <Widget>[
                ShiftDetailsPage(),
                ExplorePage(),
                ShiftDetailsPage(),
              ],
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Stack(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      indicator: BoxDecoration(color: transparentColor),
                      tabs: tabs,
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
      ),
    );
  }
}
