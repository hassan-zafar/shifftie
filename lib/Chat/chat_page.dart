import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Theme/style.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ChatBody();
  }
}

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/user/user2.png'),
            ),
            title: Text(
              'Emili Williamson',
              style: TextStyle(color: secondaryColor),
            ),
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.userProfilePage),
          ),
        ),
        body: FadedSlideAnimation(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FadedScaleAnimation(child: const MessageStream()),
              Container(
                color: darkColor,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: EntryField(
                  prefix: IconButton(
                    icon: const Icon(Icons.tag_faces),
                    color: secondaryColor,
                    onPressed: () {},
                  ),
                  controller: _messageController,
                  hint: AppLocalizations.of(context)!.writeYourComment,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: mainColor,
                    ),
                    onPressed: () {
                      _messageController.clear();
                    },
                  ),
                  counter: null,
                ),
              ),
            ],
          ),
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ));
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<MessageBubble> messageBubbles = [
      MessageBubble(
        text: locale.comment9,
        time: '01:02 pm',
//      isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        text: locale.comment10,
        time: '01:02 pm',
//      isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        text: locale.comment11,
        time: '01:00 pm',
//      isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        text: locale.comment12,
        time: '01:00 pm',
//      isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        text: locale.comment13,
        time: '11:59 am',
//      isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        text: locale.comment14,
        time: '11:58 am',
//      isDelivered: false,
        isMe: false,
      ),
    ];
    return SizedBox(
      // height: 500,
      // width: 300,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: messageBubbles,
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? time;
  final bool? isDelivered;

  const MessageBubble(
      {Key? key, this.text, this.time, this.isMe, this.isDelivered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: isMe!
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  time!,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(width: 12.0),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [btnGradLeft, btnGradRight]),
                    borderRadius: radius,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    text!,
                    textAlign: TextAlign.end,
                    style: const TextStyle(height: 1.4),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  decoration: BoxDecoration(
                    color: disabledTextColor,
                    borderRadius: radius,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    text!,
                    style: const TextStyle(height: 1.4),
                  ),
                ),
                const SizedBox(width: 12.0),
                Text(
                  time!,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
    );
  }
}
