import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shifftie/Components/continue_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Components/post_thumb_list.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';

class PostInfo extends StatefulWidget {
  const PostInfo({Key? key}) : super(key: key);

  @override
  _PostInfoState createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  var icon = Icons.check_box_outline_blank;
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  final List<PostThumbList> thumbLists = [
    PostThumbList(dance),
  ];
  static List<String> dance = [
    'assets/thumbnails/dance/Layer 951.png',
    'assets/thumbnails/dance/Layer 952.png',
    'assets/thumbnails/dance/Layer 953.png',
    'assets/thumbnails/dance/Layer 954.png',
    'assets/thumbnails/dance/Layer 951.png',
    'assets/thumbnails/dance/Layer 952.png',
    'assets/thumbnails/dance/Layer 953.png',
    'assets/thumbnails/dance/Layer 954.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.post!),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/thumbnails/dance/Layer 952.png',
                      height: 120,
                      width: 80,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EntryField(
                          // prefix: FadedScaleAnimation(
                          //   child: const CircleAvatar(
                          //     backgroundImage:
                          //         AssetImage('assets/images/user.webp'),
                          //   ),
                          // ),
                          label: '    ' +
                              AppLocalizations.of(context)!.describeVideo!,
                        ),
                      ),
                    ),
                  ],
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Shifttie Title',
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Short Description',
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Poll Question',
                  padding: EdgeInsets.all(4),
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Poll Answer',
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Poll Answer',
                  keyboardType: TextInputType.emailAddress,
                ),
                Text(
                  AppLocalizations.of(context)!.selectCover! + '\n',
                  style: TextStyle(color: secondaryColor, fontSize: 18),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: thumbLists.length,
                    itemBuilder: (context, index) {
                      return thumbLists[index];
                    }),
                const SizedBox(height: 12.0),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.commentOff!,
                    style: TextStyle(color: secondaryColor),
                  ),
                  trailing: Switch(
                    value: isSwitched1,
                    onChanged: (value) {
                      setState(() {
                        isSwitched1 = value;
                        //print(isSwitched1);
                      });
                    },
                    inactiveThumbColor: disabledTextColor,
                    inactiveTrackColor: darkColor,
                    activeTrackColor: darkColor,
                    activeColor: mainColor,
                  ),
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.saveToGallery!,
                    style: TextStyle(color: secondaryColor),
                  ),
                  trailing: Switch(
                    value: isSwitched2,
                    onChanged: (value) {
                      setState(() {
                        isSwitched2 = value;
                        //print(isSwitched2);
                      });
                    },
                    inactiveThumbColor: disabledTextColor,
                    inactiveTrackColor: darkColor,
                    activeTrackColor: darkColor,
                    activeColor: mainColor,
                  ),
                ),
                CustomButton(
                  text: AppLocalizations.of(context)!.postVideo,
                  onPressed: () {
                    Phoenix.rebirth(context);
                  },
                )
              ],
            ),
          ),
        ),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
