import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Components/custom_text_button.dart';
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
              onTap: () {}, isGradient: true, text: 'Start a new shift'),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://img.jakpost.net/c/2019/06/12/2019_06_12_74202_1560308728._large.jpg',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.timer),
                          Text(
                            "Special Event bla bla",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.thumb_up,
                          ),
                          Text(
                            "Special Event",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
