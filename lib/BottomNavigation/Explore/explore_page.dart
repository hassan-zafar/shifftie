import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/BottomNavigation/MyProfile/followers.dart';
import 'package:shifftie/Components/thumb_list.dart';
import 'package:shifftie/Components/titleRow.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';

List<String> dance = [
  'assets/thumbnails/dance/Layer 951.png',
  'assets/thumbnails/dance/Layer 952.png',
  'assets/thumbnails/dance/Layer 953.png',
  'assets/thumbnails/dance/Layer 954.png',
  'assets/thumbnails/dance/Layer 951.png',
  'assets/thumbnails/dance/Layer 952.png',
  'assets/thumbnails/dance/Layer 953.png',
  'assets/thumbnails/dance/Layer 954.png',
];
List<String> lol = [
  'assets/thumbnails/lol/Layer 978.png',
  'assets/thumbnails/lol/Layer 979.png',
  'assets/thumbnails/lol/Layer 980.png',
  'assets/thumbnails/lol/Layer 981.png',
];
List<String> food = [
  'assets/thumbnails/food/Layer 783.png',
  'assets/thumbnails/food/Layer 784.png',
  'assets/thumbnails/food/Layer 785.png',
  'assets/thumbnails/food/Layer 786.png',
  'assets/thumbnails/food/Layer 787.png',
  'assets/thumbnails/food/Layer 788.png',
];

List<String> carouselImages = [
  "assets/images/banner 1.png",
  "assets/images/banner 2.png",
//  "assets/images/banner 1.png",
//  "assets/images/banner 2.png",
];

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExploreBody();
  }
}

class ExploreBody extends StatefulWidget {
  const ExploreBody({Key? key}) : super(key: key);

  @override
  _ExploreBodyState createState() => _ExploreBodyState();
}

class _ExploreBodyState extends State<ExploreBody> {
  final List<ThumbList> thumbLists = [
    ThumbList(dance),
    ThumbList(lol),
    ThumbList(food),
    ThumbList(dance),
    ThumbList(lol),
    ThumbList(food),
  ];

  int _current = 0;
  List<User> users = [
    User("George Smith", "@georgesmith", true, 'assets/user/user1.png'),
    User("Emili Wiliamson", "@emiliwilliamson", true, 'assets/user/user2.png'),
    User("Kesha Taylor", "@iamkesha007", true, 'assets/user/user3.png'),
    User("Linda Johnson", "@lindahere", true, 'assets/user/user2.png'),
    User("Opus Labs", "@opuslabs", true, 'assets/user/user4.png'),
    User("Ling Tong", "@lingtong", true, 'assets/user/user3.png'),
    User("Tosh Williamson", "@mr.williamson", true, 'assets/user/user1.png'),
    User("Uzuz Smith", "@imuzuz", true, 'assets/user/user4.png'),
    User("Rohan Patel", "@roahnindian", true, 'assets/user/user2.png'),
    User("Opus Labs", "@opuslabs", true, 'assets/user/user4.png'),
    User("Ling Tong", "@lingtong", true, 'assets/user/user3.png'),
    User("Tosh Williamson", "@mr.williamson", true, 'assets/user/user1.png'),
    User("Uzuz Smith", "@imuzuz", true, 'assets/user/user4.png'),
    User("Rohan Patel", "@roahnindian", true, 'assets/user/user2.png'),
  ];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<TitleRow> titleRows = [
      TitleRow(locale.danceLike, '12', dance),
      TitleRow(locale.laughOut, '9', lol),
      TitleRow(locale.followUr, '14', food),
      TitleRow(locale.danceLike, '15', dance),
      TitleRow(locale.laughOut, '10', lol),
      TitleRow(locale.followUr, '9', food),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0, top: 20.0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(72.0),
          child: Container(
            margin: const EdgeInsets.all(20.0),
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextField(
              readOnly: true,
              onTap: () => Navigator.pushNamed(context, PageRoutes.searchPage),
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: secondaryColor),
                border: InputBorder.none,
                hintText: AppLocalizations.of(context)!.search,
                hintStyle: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
        body: FadedSlideAnimation(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              // Stack(
              //   children: [
              //     CarouselSlider(
              //       items: carouselImages.map((i) {
              //         return Builder(
              //           builder: (BuildContext context) {
              //             return GestureDetector(
              //               onTap: () {},
              //               child: FadedScaleAnimation(child: Image.asset(i)),
              //             );
              //           },
              //         );
              //       }).toList(),
              //       options: CarouselOptions(
              //           enableInfiniteScroll: false,
              //           viewportFraction: 1.0,
              //           autoPlay: true,
              //           aspectRatio: 3,
              //           onPageChanged: (index, reason) {
              //             setState(() {
              //               _current = index;
              //             });
              //           }),
              //     ),
              //     Positioned.directional(
              //       textDirection: Directionality.of(context),
              //       end: 20.0,
              //       bottom: 0.0,
              //       child: Row(
              //         children: carouselImages.map((i) {
              //           int index = carouselImages.indexOf(i);

              //           return Container(
              //             width: 8.0,
              //             height: 8.0,
              //             margin: const EdgeInsets.symmetric(
              //                 vertical: 16.0, horizontal: 4.0),
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: _current == index
              //                   ? const Color.fromRGBO(0, 0, 0, 0.9)
              //                   : disabledTextColor.withOpacity(0.5),
              //             ),
              //           );
              //         }).toList(),
              //       ),
              //     )
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Suggestions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Clear',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: titleRows.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(users[index].image),
                            ),
                            title: Text(
                              users[index].name,
                              style: TextStyle(color: secondaryColor),
                            ),
                            subtitle: Text(
                              users[index].username,
                              style: const TextStyle(),
                            ),
                            trailing: CustomTextButtonIntr(
                                onTap: () {},
                                isGradient: true,
                                width: 120,
                                text: 'Follow')),

                        // titleRows[index],
                        thumbLists[index],
                      ],
                    );
                  }),
            ],
          ),
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
