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
        title: Text('Shifts that you follow'),
      ),
      body: Column(
        children: [
          CustomTextButton(onTap: () {}, text: 'Start a new shift'),
          Container(
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
