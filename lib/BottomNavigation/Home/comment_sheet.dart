import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';

class Comment {
  final String? image;
  final String? name;
  final String? comment;
  final String? time;
  final String? commentLikes;

  Comment({this.image, this.name, this.commentLikes, this.comment, this.time});
}

void commentSheet(BuildContext context) async {
  var locale = AppLocalizations.of(context)!;

  List<Comment> comments = [
    Comment(
      image: 'assets/user/user1.png',
      name: 'Emili Williamson',
      commentLikes: '1.2k',
      comment: locale.comment1,
      time: ' 5' + locale.minAgo!,
    ),
    Comment(
      image: 'assets/user/user2.png',
      name: 'Yella Jackson',
      commentLikes: '1.1k',
      comment: locale.comment2,
      time: ' 15' + locale.minAgo!,
    ),
    Comment(
      image: 'assets/user/user3.png',
      name: 'Lisa devil',
      commentLikes: '23',
      comment: locale.comment3,
      time: ' 1' + locale.dayAgo!,
    ),
    Comment(
      image: 'assets/user/user4.png',
      name: 'Emila Wattson',
      commentLikes: '34',
      comment: locale.comment4,
      time: ' 2' + locale.dayAgo!,
    ),
    Comment(
      image: 'assets/user/user1.png',
      commentLikes: '45',
      name: 'Emili Williamson',
      comment: locale.comment1,
      time: ' 5' + locale.minAgo!,
    ),
    Comment(
      image: 'assets/user/user2.png',
      name: 'Yella Jackson',
      commentLikes: '2.4k',
      comment: locale.comment2,
      time: ' 15' + locale.minAgo!,
    ),
    Comment(
      image: 'assets/user/user3.png',
      name: 'Lisa devil',
      comment: locale.comment3,
      commentLikes: '2.3k',
      time: ' 1' + locale.dayAgo!,
    ),
    Comment(
        image: 'assets/user/user4.png',
        name: 'Emila Wattson',
        comment: locale.comment4,
        time: ' 2' + locale.dayAgo!,
        commentLikes: '12'),
  ];

  await showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          borderSide: BorderSide.none),
      context: context,
      builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Stack(
              children: <Widget>[
                FadedSlideAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          locale.comments!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: lightTextColor),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 60.0),
                            itemCount: comments.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  Divider(
                                    color: darkColor,
                                    thickness: 1,
                                  ),
                                  ListTile(
                                    leading: Image.asset(
                                      comments[index].image!,
                                      scale: 2.3,
                                    ),
                                    title: Text(comments[index].name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                height: 2,
                                                color: disabledTextColor)),
                                    subtitle: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: comments[index].comment,
                                        ),
                                        TextSpan(
                                            text: comments[index].time,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                      ]),
                                    ),
                                    trailing: ImageIcon(
                                      const AssetImage(
                                          'assets/icons/ic_like.png'),
                                      color: disabledTextColor,
                                    ),
                                  ),
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                  beginOffset: const Offset(0, 0.3),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: EntryField(
                    counter: null,
                    padding: EdgeInsets.zero,
                    hint: locale.writeYourComment,
                    fillColor: darkColor,
                    prefix: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.webp'),
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.send,
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ));
}
