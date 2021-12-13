import 'package:flutter/material.dart';
import 'package:shifftie/Components/thumb_tile.dart';

class ThumbList extends StatelessWidget {
  final List<String> mediaList;

   const ThumbList(this.mediaList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      height: screenWidth / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: mediaList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ThumbTile(mediaList[index]);
          }),
    );
  }
}
