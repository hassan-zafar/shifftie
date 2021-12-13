import 'package:flutter/material.dart';
import 'package:shifftie/Components/post_thumb_tile.dart';

class PostThumbList extends StatelessWidget {
  final List<String> mediaList;

  const PostThumbList(this.mediaList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: mediaList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return PostThumbTile(mediaList[index]);
          }),
    );
  }
}
