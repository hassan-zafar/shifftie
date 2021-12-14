import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Theme/colors.dart';

class HomeNewUserFollowPage extends StatefulWidget {
  const HomeNewUserFollowPage({Key? key}) : super(key: key);

  @override
  _HomeNewUserFollowPageState createState() => _HomeNewUserFollowPageState();
}

class _HomeNewUserFollowPageState extends State<HomeNewUserFollowPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Trending Creators',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: lightTextColor),
        ),
        Text(
          'Subscribe to an account if you want to see more of their stories and help direct the endings',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/video 2.png',
                  fit: BoxFit.cover,
                  height: 250,
                ),
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/user/user1.png'),
                    ),
                    Text(
                      'Designstudio',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: lightTextColor),
                    ),
                    Text(
                      'Hello, my name is pat s..',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    CustomTextButtonIntr(
                        onTap: () {}, isGradient: true, text: 'Subscribe'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
