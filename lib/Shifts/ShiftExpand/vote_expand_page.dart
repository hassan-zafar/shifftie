import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Theme/constants.dart';

class VoteDetailsPage extends StatefulWidget {
  const VoteDetailsPage({Key? key, this.image}) : super(key: key);
  final String? image;
  @override
  _VoteDetailsPageState createState() => _VoteDetailsPageState();
}

class _VoteDetailsPageState extends State<VoteDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(borderRadius: borderRadius),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      widget.image!,
                      fit: BoxFit.cover,
                      color: Colors.black45,
                      colorBlendMode: BlendMode.darken,
                      height: 380,
                      width: 280,
                    ),
                    Positioned(
                        bottom: -20,
                        child: Image.asset('assets/icons/winner_icon.png'))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Designstudio',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: lightTextColor),
                  ),
                  Text(
                    'Most Loved',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  CustomTextButtonIntr(
                      height: 50,
                      width: 150,
                      onTap: () {},
                      fontSize: 16,
                      isGradient: true,
                      text: '1,870 Likes'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
