import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class Notif {
  final String name;
  final String? desc;
  final String time;
  final String image;
  final String notifImage;
  final IconData icon;

  Notif(
      this.name, this.desc, this.time, this.image, this.notifImage, this.icon);
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Notif> notification = [
      Notif(
          "Emili Williamson",
          locale.likedYourVideo,
          "5 " + locale.minAgo!,
          "assets/user/user1.png",
          "assets/thumbnails/dance/Layer 951.png",
          Icons.favorite),
      Notif(
          "Kesha Taylor",
          locale.commentedOnYour,
          "5 " + locale.minAgo!,
          "assets/user/user2.png",
          "assets/thumbnails/dance/Layer 952.png",
          Icons.message),
      Notif(
          "Ling Tong",
          locale.commentedOnYour,
          "5 " + locale.minAgo!,
          "assets/user/user3.png",
          "assets/thumbnails/food/Layer 783.png",
          Icons.message),
      Notif(
          "Linda Johnson",
          locale.likedYourVideo,
          "5 " + locale.minAgo!,
          "assets/user/user4.png",
          "assets/thumbnails/food/Layer 786.png",
          Icons.favorite),
      Notif("George Smith", locale.startedFollowing, "5 " + locale.minAgo!,
          "assets/user/user1.png", "assets/images/user.webp", Icons.add),
    ];

    List<String?> messages = [
      locale.heyILikeYourVideos,
      locale.yesIUse,
      locale.noWorries,
      locale.ohThank,
      locale.alreadyLikedIt,
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              indicator: BoxDecoration(color: transparentColor),
              isScrollable: true,
              labelColor: lightTextColor,
              labelStyle: Theme.of(context).textTheme.headline6,
              unselectedLabelColor: disabledTextColor,
              tabs: <Widget>[
                Tab(text: locale.notifications),
                Tab(text: locale.messages),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FadedSlideAnimation(
              child: NotificationPage(notification: notification),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              child:
                  MessagesPage(notification: notification, messages: messages),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final List<Notif> notification;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notification.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Stack(children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  backgroundImage: AssetImage(notification[index].image)),
              title: Text(
                notification[index].name,
                style: TextStyle(color: secondaryColor),
              ),
              subtitle: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: notification[index].desc! + ' ',
                  style: TextStyle(color: lightTextColor),
                ),
                TextSpan(
                    text: notification[index].time,
                    style: TextStyle(color: lightTextColor.withOpacity(0.15)))
              ])),
              trailing: SizedBox(
                width: 50,
                //height: 45,
                child: notification[index].icon == Icons.add
                    ? const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/images/user.webp'),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image:
                                    AssetImage(notification[index].notifImage),
                                fit: BoxFit.fill))),
              ),
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.userProfilePage),
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                end: 55,
                bottom: 10,
                child: CircleAvatar(
                  backgroundColor: mainColor,
                  child: Icon(
                    notification[index].icon,
                    color: Colors.white,
                    size: 10,
                  ),
                  radius: 10,
                )),
          ]);
        });
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({
    Key? key,
    required this.notification,
    required this.messages,
  }) : super(key: key);

  final List<Notif> notification;
  final List<String?> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notification.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage(notification[index].image)),
            title: Text(
              notification[index].name,
              style: TextStyle(color: secondaryColor),
            ),
            subtitle: Row(
              children: <Widget>[
                Text(
                  messages[index]!,
                  style: TextStyle(color: lightTextColor),
                ),
              ],
            ),
            trailing: Text(
              notification[index].time,
              style: TextStyle(color: lightTextColor.withOpacity(0.15)),
            ),
            onTap: () => Navigator.pushNamed(context, PageRoutes.chatPage),
          );
        });
  }
}
