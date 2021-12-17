import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Components/profile_page_button.dart';
import 'package:shifftie/Components/row_item.dart';
import 'package:shifftie/Components/sliver_app_delegate.dart';
import 'package:shifftie/Components/tab_grid.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/BottomNavigation/MyProfile/edit_profile.dart';
import 'package:shifftie/BottomNavigation/MyProfile/followers.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/BottomNavigation/Explore/explore_page.dart';
import 'package:shifftie/BottomNavigation/MyProfile/following.dart';
import 'package:shifftie/Theme/constants.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyProfileBody();
  }
}

class MyProfileBody extends StatefulWidget {
  const MyProfileBody({Key? key}) : super(key: key);

  @override
  _MyProfileBodyState createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody> {
  final key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Scaffold(
        backgroundColor: darkColor,
        body: Stack(
          children: [
            DefaultTabController(
              length: 3,
              child: SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: 404.0,
                        floating: false,
                        actions: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(
                              cardColor: backgroundColor,
                            ),
                            child: PopupMenuButton(
                              icon: Icon(
                                Icons.more_vert,
                                color: secondaryColor,
                              ),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                              onSelected: (dynamic value) {
                                if (value == locale!.changeLanguage) {
                                  Navigator.pushNamed(
                                      context, PageRoutes.languagePage);
                                } else if (value == locale.help) {
                                  Navigator.pushNamed(
                                      context, PageRoutes.helpPage);
                                } else if (value == locale.termsOfUse) {
                                  Navigator.pushNamed(
                                      context, PageRoutes.tncPage);
                                } else if (value == locale.logout) {
                                  Phoenix.rebirth(context);
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(
                                    child: Text(locale!.changeLanguage!),
                                    value: locale.changeLanguage,
                                    textStyle: TextStyle(color: secondaryColor),
                                  ),
                                  PopupMenuItem(
                                    child: Text(locale.help!),
                                    value: locale.help,
                                    textStyle: TextStyle(color: secondaryColor),
                                  ),
                                  PopupMenuItem(
                                    child: Text(locale.termsOfUse!),
                                    value: locale.termsOfUse,
                                    textStyle: TextStyle(color: secondaryColor),
                                  ),
                                  PopupMenuItem(
                                    child: Text(locale.logout!),
                                    value: locale.logout,
                                    textStyle: TextStyle(color: secondaryColor),
                                  )
                                ];
                              },
                            ),
                          )
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              const Spacer(flex: 10),
                              const CircleAvatar(
                                radius: 28.0,
                                backgroundImage:
                                    AssetImage('assets/images/user.webp'),
                              ),
                              const Spacer(),
                              const Text(
                                'Samantha Smith',
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomTextButton(
                                      paddingHor: 6,
                                      paddingVert: 6,
                                      fontSize: 8,
                                      borderRadius: borderRadius,
                                      onTap: () {},
                                      isGradient: true,
                                      text: 'Subscribe 9\$/Mo for Exclusivity'),
                                  Icon(
                                    Icons.message_outlined,
                                    color: lightTextColor,
                                    size: 18,
                                  )
                                ],
                              ),
                              const Spacer(),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: <Widget>[
                              //     ImageIcon(
                              //       const AssetImage("assets/icons/ic_fb.png"),
                              //       color: secondaryColor,
                              //       size: 10,
                              //     ),
                              //     const SizedBox(width: 16),
                              //     ImageIcon(
                              //       const AssetImage("assets/icons/ic_twt.png"),
                              //       color: secondaryColor,
                              //       size: 10,
                              //     ),
                              //     const SizedBox(width: 16),
                              //     ImageIcon(
                              //       const AssetImage(
                              //           "assets/icons/ic_insta.png"),
                              //       color: secondaryColor,
                              //       size: 10,
                              //     ),
                              //   ],
                              // ),

                              Text(
                                locale!.comment5!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 8),
                              ),
                              ProfilePageButton(
                                locale.editProfile,
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfile()));
                                },
                                width: 120,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RowItem(
                                      '1.2m',
                                      locale.liked,
                                      Scaffold(
                                        appBar: AppBar(
                                          title: const Text('Liked'),
                                        ),
                                        body: TabGrid(
                                          food,
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
                              Tab(icon: Icon(Icons.favorite_border)),
                              Tab(icon: Icon(Icons.bookmark_border)),
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
                        child: TabGrid(
                          food + food,
                          viewIcon: Icons.remove_red_eye,
                          views: '2.2k',
                          onTap: () => Navigator.pushNamed(
                              context, PageRoutes.videoOptionPage),
                        ),
                        beginOffset: const Offset(0, 0.3),
                        endOffset: const Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      ),
                      FadedSlideAnimation(
                        child: TabGrid(
                          dance,
                          icon: Icons.favorite,
                        ),
                        beginOffset: const Offset(0, 0.3),
                        endOffset: const Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      ),
                      FadedSlideAnimation(
                        child: TabGrid(
                          lol,
                          icon: Icons.bookmark,
                        ),
                        beginOffset: const Offset(0, 0.3),
                        endOffset: const Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
