import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Home/comment_sheet.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';

class ShiftCommentPage extends StatefulWidget {
  const ShiftCommentPage({Key? key}) : super(key: key);

  @override
  Shift_CommentStatePage createState() => Shift_CommentStatePage();
}

class Shift_CommentStatePage extends State<ShiftCommentPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List<Comment> comments = [
      Comment(
        image: 'assets/user/user1.png',
        name: 'Emili Williamson',
        comment: locale.comment1,
        time: ' 5' + locale.minAgo!,
      ),
      Comment(
        image: 'assets/user/user2.png',
        name: 'Yella Jackson',
        comment: locale.comment2,
        time: ' 15' + locale.minAgo!,
      ),
      Comment(
        image: 'assets/user/user3.png',
        name: 'Lisa devil',
        comment: locale.comment3,
        time: ' 1' + locale.dayAgo!,
      ),
      Comment(
        image: 'assets/user/user4.png',
        name: 'Emila Wattson',
        comment: locale.comment4,
        time: ' 2' + locale.dayAgo!,
      ),
      Comment(
        image: 'assets/user/user1.png',
        name: 'Emili Williamson',
        comment: locale.comment1,
        time: ' 5' + locale.minAgo!,
      ),
      Comment(
        image: 'assets/user/user2.png',
        name: 'Yella Jackson',
        comment: locale.comment2,
        time: ' 15' + locale.minAgo!,
      ),
      Comment(
        image: 'assets/user/user3.png',
        name: 'Lisa devil',
        comment: locale.comment3,
        time: ' 1' + locale.dayAgo!,
      ),
      Comment(
        image: 'assets/user/user4.png',
        name: 'Emila Wattson',
        comment: locale.comment4,
        time: ' 2' + locale.dayAgo!,
      ),
    ];

    return Stack(
      children: <Widget>[
        FadedSlideAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 30,
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
                                        height: 2, color: disabledTextColor)),
                            subtitle: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: comments[index].comment,
                                ),
                                TextSpan(
                                    text: comments[index].time,
                                    style: Theme.of(context).textTheme.caption),
                              ]),
                            ),
                            trailing: ImageIcon(
                              const AssetImage('assets/icons/ic_like.png'),
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
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
    );
  }
}
