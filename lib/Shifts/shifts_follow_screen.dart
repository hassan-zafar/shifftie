import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Shifts/ShiftExpand/shift_tabbar_page.dart';
import 'package:shifftie/Theme/colors.dart';

class ShiftYouFollowScreen extends StatefulWidget {
  const ShiftYouFollowScreen({Key? key}) : super(key: key);

  @override
  _ShiftYouFollowScreenState createState() => _ShiftYouFollowScreenState();
}

class _ShiftYouFollowScreenState extends State<ShiftYouFollowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shifts that you follow'),
      ),
      body: Column(
        children: [
          CustomTextButton(
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.bottomNavigation),
              isGradient: true,
              text: 'Start a new shift'),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ShiftTabBarPage(),
              )),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          'https://img.jakpost.net/c/2019/06/12/2019_06_12_74202_1560308728._large.jpg',
                        ),
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.color),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Special Event bla bla",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Icon(
                          Icons.video_call,
                          color: lightTextColor,
                        )
                      ],
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
                              backgroundImage:
                                  AssetImage('assets/user/user1.png'),
                            ),
                            Text(
                              "Special Event bla bla",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                        CustomTextButtonIntr(
                          onTap: () {},
                          isGradient: true,
                          text: 'Vote',
                          paddingHor: 16,
                          height: 40,
                          width: 90,
                          paddingVert: 8,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
