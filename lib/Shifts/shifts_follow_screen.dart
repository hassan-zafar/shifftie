import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Components/custom_text_button.dart';

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
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://img.jakpost.net/c/2019/06/12/2019_06_12_74202_1560308728._large.jpg'))),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Special Event bla bla"),
                    Icon(Icons.video_call)
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.timer),
                        Text("Special Event bla bla"),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.thumb_up,
                        ),
                        Text("Special Event"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
