import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Explore/explore_page.dart';
import 'package:shifftie/BottomNavigation/MyProfile/followers.dart';
import 'package:shifftie/Components/profile_page_button.dart';
import 'package:shifftie/Components/row_item.dart';
import 'package:shifftie/Components/sliver_app_delegate.dart';
import 'package:shifftie/Components/tab_grid.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/BottomNavigation/MyProfile/following.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserProfileBody();
  }
}

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({Key? key}) : super(key: key);

  @override
  _UserProfileBodyState createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  bool isFollowed = false;

  // var followText;
  final key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: darkColor,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 400.0,
                  floating: false,
                  actions: <Widget>[
                    PopupMenuButton(
                      color: backgroundColor,
                      icon: Icon(
                        Icons.more_vert,
                        color: secondaryColor,
                      ),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none),
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: Text(locale!.report!),
                            value: locale.report,
                            textStyle: TextStyle(color: secondaryColor),
                          ),
                          PopupMenuItem(
                            child: Text(locale.block!),
                            value: locale.block,
                            textStyle: TextStyle(color: secondaryColor),
                          ),
                        ];
                      },
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Column(
                      children: <Widget>[
                        const Spacer(flex: 10),
                        FadedScaleAnimation(
                          child: const CircleAvatar(
                            radius: 28.0,
                            backgroundImage:
                                AssetImage('assets/user/user1.png'),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Spacer(flex: 12),
                            const Text(
                             currentUser. 'Emili Williamson',
                              style: TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/icons/ic_verified.png',
                              scale: 4,
                            ),
                            const Spacer(flex: 8),
                          ],
                        ),
                        Text(
                          '@emilithedancer',
                          style:
                              TextStyle(fontSize: 10, color: disabledTextColor),
                        ),
                        const Spacer(),
                        FadedScaleAnimation(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ImageIcon(
                                const AssetImage(
                                  "assets/icons/ic_fb.png",
                                ),
                                color: secondaryColor,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ImageIcon(
                                const AssetImage("assets/icons/ic_twt.png"),
                                color: secondaryColor,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ImageIcon(
                                const AssetImage("assets/icons/ic_insta.png"),
                                color: secondaryColor,
                                size: 10,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          locale!.comment7!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ProfilePageButton(
                                locale.message,
                                () => Navigator.pushNamed(
                                    context, PageRoutes.chatPage)),
                            const SizedBox(width: 16),
                            isFollowed
                                ? ProfilePageButton(locale.following, () {
                                    setState(() {
                                      isFollowed = false;
                                    });
                                  })
                                : ProfilePageButton(
                                    locale.follow,
                                    () {
                                      setState(() {
                                        isFollowed = true;
                                      });
                                    },
                                    color: mainColor,
                                    textColor: secondaryColor,
                                  ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RowItem(
                                '1.2m',
                                locale.liked,
                                Scaffold(
                                  appBar: AppBar(
                                    title: const Text('Liked'),
                                  ),
                                  body: TabGrid(
                                    food + lol,
                                  ),
                                )),
                            RowItem('12.8k', locale.followers,
                                const FollowersPage()),
                            RowItem('1.9k', locale.following,
                                const FollowingPage()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    TabBar(
                      labelColor: mainColor,
                      unselectedLabelColor: lightTextColor,
                      indicatorColor: transparentColor,
                      tabs: const [
                        Tab(icon: Icon(Icons.dashboard)),
                        Tab(
                          icon: ImageIcon(AssetImage(
                            'assets/icons/ic_like.png',
                          )),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                FadedSlideAnimation(
                  child: TabGrid(dance),
                  beginOffset: const Offset(0, 0.3),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
                FadedSlideAnimation(
                  child: TabGrid(food + lol),
                  beginOffset: const Offset(0, 0.3),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
