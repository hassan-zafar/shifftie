import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Theme/constants.dart';

class HomeNewUserFollowPage extends StatefulWidget {
  const HomeNewUserFollowPage({Key? key}) : super(key: key);

  @override
  _HomeNewUserFollowPageState createState() => _HomeNewUserFollowPageState();
}

class _HomeNewUserFollowPageState extends State<HomeNewUserFollowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              'Trending Creators',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: lightTextColor),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, right: 28.0, top: 8, bottom: 8),
              child: Text(
                'Subscribe to an account if you want to see more of their stories and help direct the endings',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: borderRadius),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/video 2.png',
                          fit: BoxFit.cover,
                          color: Colors.black45,
                          colorBlendMode: BlendMode.darken,
                          height: 380,
                          width: 280,
                        ),
                        Positioned(
                          bottom: 160,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/user/user1.png'),
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
                                  height: 50,
                                  width: 150,
                                  onTap: () {},
                                  fontSize: 16,
                                  isGradient: true,
                                  text: 'Subscribe'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: borderRadius),
                    margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/video 2.png',
                          fit: BoxFit.cover,
                          color: Colors.black45,
                          colorBlendMode: BlendMode.darken,
                          height: 380,
                          width: 280,
                        ),
                        Positioned(
                          bottom: 160,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/user/user1.png'),
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
                                  height: 50,
                                  width: 150,
                                  onTap: () {},
                                  fontSize: 16,
                                  isGradient: true,
                                  text: 'Subscribe'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
