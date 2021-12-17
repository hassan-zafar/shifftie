import 'package:flutter/material.dart';
import 'package:shifftie/BottomNavigation/Explore/more_page.dart';
import 'package:shifftie/Theme/colors.dart';

class TitleRow extends StatelessWidget {
  final String? title;
  final String subTitle;
  final List list;

  const TitleRow(this.title, this.subTitle, this.list, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: darkColor,
          child: Text(
            '#',
            style: TextStyle(color: mainColor),
          ),
        ),
        title: Text(
          title!,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Row(
          children: <Widget>[
            const Spacer(),
            Text(
              subTitle + ' Shiftie',
              style: Theme.of(context).textTheme.caption,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: secondaryColor,
              size: 10,
            ),
          ],
        ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MorePage(
                        title: title,
                        list: list,
                      )),
            ));
  }
}
