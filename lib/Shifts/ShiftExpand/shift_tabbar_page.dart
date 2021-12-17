import 'package:flutter/material.dart';
import 'package:shifftie/Components/tab_grid.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Shifts/ShiftExpand/commentPage.dart';
import 'package:shifftie/Shifts/ShiftExpand/shift_details.dart';
import 'package:shifftie/Theme/colors.dart';

class ShiftTabBarPage extends StatefulWidget {
  const ShiftTabBarPage({Key? key}) : super(key: key);

  @override
  _ShiftTabBarPageState createState() => _ShiftTabBarPageState();
}

class _ShiftTabBarPageState extends State<ShiftTabBarPage> {
  List<String> food = [
    'assets/thumbnails/food/Layer 783.png',
    'assets/thumbnails/food/Layer 784.png',
    'assets/thumbnails/food/Layer 785.png',
    'assets/thumbnails/food/Layer 786.png',
    'assets/thumbnails/food/Layer 787.png',
    'assets/thumbnails/food/Layer 788.png',
  ];
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      const Tab(text: 'Details'),
      const Tab(text: 'Vote'),
      const Tab(text: 'Comment'),
    ];
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: tabs.length,
          child: Stack(
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  const ShiftDetailsPage(),
                  TabGrid(
                    food + food,
                    viewIcon: Icons.remove_red_eye,
                    views: '2.2k',
                    onTap: () => Navigator.pushNamed(
                        context, PageRoutes.videoOptionPage),
                  ),
                  const ShiftCommentPage(),
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
      ),
    );
  }
}
