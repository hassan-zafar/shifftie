import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Home/following_tab.dart';
import 'package:shifftie/BottomNavigation/Home/home_page.dart';
import 'package:shifftie/Theme/colors.dart';


class Grid {
  Grid(this.imgUrl, this.views);
  String imgUrl;
  String views;
}
class TabGrid extends StatelessWidget {
  final IconData? icon;
  final List? list;
  final Function? onTap;
  final IconData? viewIcon;
  final String? views;

    const TabGrid(this.list, {Key? key, this.icon, this.onTap, this.viewIcon, this.views}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 2.5,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FollowingTabPage(
                        videos1, imagesInDisc1, false,
                        variable: 1))),
            child: FadedScaleAnimation(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(list![index]), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      viewIcon,
                      color: secondaryColor,
                      size: 15,
                    ),
                    views != null ? Text(' ' + views!) : const SizedBox.shrink(),
                    const Spacer(),
                    Icon(
                      icon,
                      color: mainColor,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
