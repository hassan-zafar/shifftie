import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Components/tab_grid.dart';

class MorePage extends StatelessWidget {
  final String? title;
  final List? list;

  const MorePage({Key? key, this.title, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: FadedSlideAnimation(
            child: TabGrid(list),
            beginOffset: const Offset(0.3, 0.3),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          )),
    );
  }
}
