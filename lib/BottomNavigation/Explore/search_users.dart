import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Explore/explore_page.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Extension/extensions.dart';
import 'package:shifftie/Components/tab_grid.dart';

class User {
  User(this.name, this.id, this.img);
  String name;
  String id;
  String img;
}

class SearchUsers extends StatefulWidget {
  const SearchUsers({Key? key}) : super(key: key);

  @override
  _SearchUsersState createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  final _controller = TextEditingController();
  List<User> names = [
    User("Food Master", "@georgesmith", "assets/user/user1.png"),
    User("Foody Girl", "@emiliwilliamson", "assets/user/user2.png"),
    User("Foodzilla", "@foodyzilla", "assets/user/user3.png"),
    User("Linda Johnson", "@lindahere", "assets/user/user4.png"),
    User("Opus Labs", "@opuslabs", "assets/user/user1.png"),
    User("Ling Tong", "@lingtong", "assets/user/user2.png"),
    User("Tosh Williamson", "@toshwilliamson", "assets/user/user3.png"),
    User("Linda Johnson", "@lindahere", "assets/user/user4.png"),
    User("Food Master", "@georgesmith", "assets/user/user1.png"),
    User("Foody Girl", "@emiliwilliamson", "assets/user/user2.png"),
    User("Foodzilla", "@foodyzilla", "assets/user/user3.png"),
    User("Linda Johnson", "@lindahere", "assets/user/user4.png"),
  ];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(66.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        icon: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: secondaryColor,
                          onPressed: () => Navigator.pop(context),
                        ),
                        border: InputBorder.none,
                        hintText: AppLocalizations.of(context)!.search,
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          color: secondaryColor,
                          onPressed: () {
                            _controller.clear();
                          },
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    indicator: BoxDecoration(color: transparentColor),
                    isScrollable: true,
                    labelColor: mainColor,
                    labelStyle: Theme.of(context).textTheme.headline6,
                    unselectedLabelColor: disabledTextColor,
                    tabs: <Widget>[
                      Tab(text: local.video!.capitalize()),
                      Tab(text: local.users),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FadedSlideAnimation(
              child: TabGrid(
                dance + food,
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.videoOptionPage),
              ),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: names.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Divider(
                          color: darkColor,
                          height: 1.0,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: FadedScaleAnimation(
                            child: CircleAvatar(
                              backgroundColor: darkColor,
                              backgroundImage: AssetImage(names[index].img),
                            ),
                          ),
                          title: Text(
                            names[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(names[index].id),
                          onTap: () => Navigator.pushNamed(
                              context, PageRoutes.userProfilePage),
                        ),
                      ],
                    );
                  }),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            )
          ],
        ),
      ),
    );
  }
}
