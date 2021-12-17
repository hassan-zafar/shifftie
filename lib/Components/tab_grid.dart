import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/BottomNavigation/Home/following_tab.dart';
import 'package:shifftie/BottomNavigation/Home/home_page.dart';
import 'package:shifftie/Shifts/ShiftExpand/vote_expand_page.dart';
import 'package:shifftie/utilities/utilities.dart';

class Grid {
  Grid(this.imgUrl, this.views);
  String imgUrl;
  String views;
}

List<bool> boolList = [
  true,
  false,
  true,
  true,
  false,
  false,
  true,
  false,
  true,
  true,
  false,
  false,
];

class TabGrid extends StatelessWidget {
  final IconData? icon;
  final List? list;
  final Function? onTap;
  final IconData? viewIcon;
  final String? views;
  final bool isVote;

  const TabGrid(this.list,
      {Key? key,
      this.icon,
      this.onTap,
      this.viewIcon,
      this.isVote = false,
      this.views})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                if (isVote) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VoteDetailsPage(
                                image: list![index],
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FollowingTabPage(
                              videos1, imagesInDisc1, false,
                              variable: 1)));
                }
              },
              child: FadedScaleAnimation(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(list![index]), fit: BoxFit.fill),
                        borderRadius:
                            BorderRadius.circular(Utilities.borderRadius),
                      ),
                      // padding: const EdgeInsets.only(
                      //     bottom: 50, top: 50, left: 30, right: 30),
                      //  Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Icon(
                      //       viewIcon,
                      //       color: secondaryColor,
                      //       size: 15,
                      //     ),
                      //     views != null
                      //         ? Text(' ' + views!)
                      //         : const SizedBox.shrink(),
                      //     const Spacer(),
                      //     Icon(
                      //       icon,
                      //       color: mainColor,
                      //     )
                      //   ],
                      // ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: CustomTextButtonIntr(
                        isGradient: boolList[index],
                        height: 40,
                        width: 120,
                        isInGridTile: boolList[index],
                        fontSize: 16,
                        onTap: () {},
                        text: boolList[index] ? 'Like' : 'Vote +1',
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
        });
    // return GridView.builder(
    //   physics: const BouncingScrollPhysics(),
    //   itemCount: list!.length,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 3,
    //     childAspectRatio: 2 / 2.5,
    //     crossAxisSpacing: 3,
    //     mainAxisSpacing: 3,
    //   ),
    //   itemBuilder: (context, index) {
    //     return GestureDetector(
    //       onTap: () => Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => FollowingTabPage(
    //                   videos1, imagesInDisc1, false,
    //                   variable: 1))),
    //       child: FadedScaleAnimation(
    //         child: Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage(list![index]), fit: BoxFit.fill),
    //             borderRadius: BorderRadius.circular(5),
    //           ),
    //           padding: const EdgeInsets.all(8),
    //           child: Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Icon(
    //                 viewIcon,
    //                 color: secondaryColor,
    //                 size: 15,
    //               ),
    //               views != null ? Text(' ' + views!) : const SizedBox.shrink(),
    //               const Spacer(),
    //               Icon(
    //                 icon,
    //                 color: mainColor,
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
