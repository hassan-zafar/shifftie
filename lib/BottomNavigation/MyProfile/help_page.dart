import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';

class Help {
  final String? question;
  final String answer;

  Help(this.question, this.answer);
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Help> helps = [
      Help(locale.howToCreateAccount,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin magna velit, posuere eu consequat id, fermentum in ex. Phasellus imperdiet, ante sit amet rhoncus mattis, quam dolor venenatis felis, vitae mollis sapien lorem a justo.\n\nVestibulum ut nunc et tortor porta blandit. Sed tincidunt urna eu urna bibendum iaculis. Duis porttitor ac dui ac mattis. Aenean eu nulla ut dolor accumsan tincidunt. Aliquam viverra mattis arcu.'),
      Help(locale.howToChangePassword,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
      Help(locale.howToPostVideo,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
      Help(locale.howToDeleteVideo,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
      Help(locale.howToChangeProfileInfo,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
      Help(locale.howCanIShare,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
      Help(locale.howToChangeProfileInfo,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
      Help(locale.howToPostVideo,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
      Help(locale.howToDeleteVideo,
          'Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo.'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.help!),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            itemCount: helps.length,
            itemBuilder: (context, index) {
              return RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(height: 1.3),
                    children: [
                      TextSpan(text: helps[index].question),
                      TextSpan(
                        text: '\n' + helps[index].answer + '\n',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: secondaryColor),
                      ),
                    ]),
              );
            }),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
