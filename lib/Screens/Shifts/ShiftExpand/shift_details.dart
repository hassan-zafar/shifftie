import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/BottomNavigation/Explore/explore_page.dart';
import 'package:shifftie/Components/thumb_list.dart';
import 'package:shifftie/Components/titleRow.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/custom_unicorn_button.dart';

import '../donations_sheet.dart';

class ShiftDetailsPage extends StatefulWidget {
  const ShiftDetailsPage({Key? key}) : super(key: key);

  @override
  _ShiftDetailsPageState createState() => _ShiftDetailsPageState();
}

class _ShiftDetailsPageState extends State<ShiftDetailsPage> {
  final List<ThumbList> thumbLists = [
    ThumbList(dance),
    ThumbList(lol),
    ThumbList(food),
    ThumbList(dance),
    ThumbList(lol),
    ThumbList(food),
  ];

  final int _current = 0;
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
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Special Event  Bla Bla Bla',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: captionTextColor,
                        ),
                        Text(
                          "Special Event bla bla",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          color: captionTextColor,
                        ),
                        Text(
                          "Special Event",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/user/user1.png'),
                        ),
                        Text(
                          "Alex Blake",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    CustomTextButtonIntr(
                      onTap: () {},
                      isGradient: true,
                      text: 'Subscribe \$9/month',
                      paddingHor: 6,
                      height: 50,
                      width: 160,
                      paddingVert: 6,
                      fontSize: 14,
                    ),
                  ],
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: titleRows.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          titleRows[index],
                          thumbLists[index],
                        ],
                      );
                    }),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(bottom: 15, top: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    // Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyOutlinedButton(
                      onPressed: () {},
                      gradient:
                          LinearGradient(colors: [btnGradLeft, btnGradRight]),
                      child: Text(
                        'View Shift',
                        style: TextStyle(color: btnGradLeft, fontSize: 20),
                      ),
                    ),
                  ),
                  CustomTextButtonIntr(
                      onTap: () {
                        donationSheet(context);
                      },
                      isGradient: true,
                      text: 'Contribute')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
