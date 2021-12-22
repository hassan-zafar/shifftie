import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../generated/l10n.dart';
import '../../../models/entities/user.dart';
import '../../../screens/base_screen.dart';
import '../firebase_service.dart';
import 'chat_screen.dart';

class VendorListChatScreen extends StatelessWidget {
  final User? user;

  const VendorListChatScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).chatListScreen,
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ChatItemsStream(user: user!),
      ),
    );
  }
}

class ChatItemsStream extends StatefulWidget {
  final User user;

  const ChatItemsStream({required this.user});

  @override
  _ChatItemsStreamState createState() => _ChatItemsStreamState();
}

class _ChatItemsStreamState extends BaseScreen<ChatItemsStream> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    var chatItems = FirebaseFirestore.instance
        .collection('chatRooms')
        .orderBy('createdAt', descending: true);
    return StreamBuilder<QuerySnapshot>(
      stream: chatItems.snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }

        return ListView.builder(
          itemBuilder: (_, index) {
            if (snapshot.data!.docs[index].id.contains(user.email! + '-') ||
                snapshot.data!.docs[index].id.contains('-' + user.email!)) {
              return ChatItem(
                user: user,
                documentId: snapshot.data!.docs[index].id,
              );
            }
            return Container();
          },
          itemCount: snapshot.data!.docs.toList().length,
        );
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final User user;

  final String? documentId;

  const ChatItem({required this.user, this.documentId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseServices()
          .firestore!
          .collection('chatRooms')
          .doc(documentId)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
          case ConnectionState.done:
            if (!snapshot.hasData) return Container();
        }
        try {
          var data = snapshot.data!.data()! as Map<String, dynamic>;
          var users = List<Map<dynamic, dynamic>>.from(data['users']);
          final receiver =
              users.firstWhereOrNull((o) => o['email'] != user.email)!;
          final timeDif = DateTime.now()
              .difference(DateTime.parse(data['createdAt']).toLocal());

          final me = users.firstWhereOrNull((o) => o['email'] == user.email)!;
          final unread = me['unread'] ?? 0;

          return GestureDetector(
              onTap: () {
                FirebaseServices()
                    .firestore!
                    .collection('chatRooms')
                    .doc(documentId)
                    .update({
                  'isSeenByAdmin': true,
                  'userTyping': false,
                  'adminTyping': false
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                        senderUser: user,
                        receiverName: receiver['name'],
                        receiverEmail: receiver['email']),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Card(
                  color: Theme.of(context).bottomAppBarColor,
                  elevation: 1.5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20.0, right: 10.0),
                    trailing: unread > 0
                        ? Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                '$unread',
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ),
                          )
                        : null,
                    leading: Icon(
                      CupertinoIcons.person_circle_fill,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Text(
                            receiver['name'],
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            timeago.format(DateTime.now().subtract(timeDif),
                                locale: 'en'),
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontStyle: FontStyle.italic, fontSize: 10.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    subtitle: data['userTyping']
                        ? Text(
                            '${receiver['email'].toString().split('@').first} is typing ...',
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontStyle: FontStyle.italic, fontSize: 12.0),
                            overflow: TextOverflow.fade,
                          )
                        : Text(
                            '${data['lastestMessage']}',
                            style: DefaultTextStyle.of(context).style,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                    dense: true,
                    enabled: data['isSeenByAdmin'],
                  ),
                ),
              ));
        } catch (e) {
          return Container();
        }
      },
    );
  }
}
