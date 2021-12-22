import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase_service.dart';

class TypingStream extends StatefulWidget {
  final bool? isAdminLoggedIn;
  final String? userEmail;

  const TypingStream({this.isAdminLoggedIn, this.userEmail});

  @override
  _TypingStreamState createState() => _TypingStreamState();
}

class _TypingStreamState extends State<TypingStream>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
//    _setInitTypingValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var avatarUserUrl =
    //     'https://api.hello-avatar.com/adorables/5/${widget.userEmail}.png';
    // var avatarAdminUrl =
    //     'https://api.hello-avatar.com/adorables/5/${config.adminEmail}.png';

    return StreamBuilder(
      stream: FirebaseServices()
          .firestore!
          .collection('chatRooms')
          .doc(widget.userEmail)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData && (snapshot.data == null)) {
          FirebaseServices()
              .firestore!
              .collection('chatRooms')
              .doc(widget.userEmail)
              .set({'userTyping': false, 'adminTyping': false},
                  SetOptions(merge: true));
          return Container();
        }
        var document;
        try {
          document = snapshot.data as Map;
        } catch (e) {
          return Container();
        }

        if (document['userTyping'] == null || document['adminTyping'] == null) {
          return Container();
        }

        if (widget.isAdminLoggedIn! && document['userTyping'] ||
            !widget.isAdminLoggedIn! && document['adminTyping']) {
          controller.forward();
          return FadeTransition(
            opacity: CurvedAnimation(
                parent: animation as Animation<double>, curve: Curves.easeIn),
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.person),
                  // widget.isAdminLoggedIn!
                  //     ? ImageTools.getCachedAvatar(avatarUserUrl)
                  //     : ImageTools.getCachedAvatar(avatarAdminUrl),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'is typing...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        controller.reset();

        return Container();
      },
    );
  }
}
