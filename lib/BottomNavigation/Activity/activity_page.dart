import 'package:flutter/material.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Theme/constants.dart';
import 'package:shifftie/utilities/utilities.dart';

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
  bool enableAnimatedContainer = false;

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
          appBar: AppBar(titleSpacing: 0.0, title: const Text('Activity')
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: TabBar(
              //     indicator: BoxDecoration(color: transparentColor),
              //     isScrollable: true,
              //     labelColor: lightTextColor,
              //     labelStyle: Theme.of(context).textTheme.headline6,
              //     unselectedLabelColor: disabledTextColor,
              //     tabs: <Widget>[
              //       Tab(text: locale.notifications),
              //       Tab(text: locale.messages),
              //     ],
              //   ),
              // ),
              ),
          body: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            enableAnimatedContainer = !enableAnimatedContainer;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              color: textFieldColor,
                              borderRadius: borderRadius),
                          child: Row(
                            children: [
                              const Text('All Activity'),
                              enableAnimatedContainer
                                  ? Icon(
                                      Icons.arrow_drop_up,
                                      color: lightTextColor,
                                    )
                                  : Icon(
                                      Icons.arrow_drop_down,
                                      color: lightTextColor,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(borderRadius: borderRadius),
                        child: TextField(
                          style: TextStyle(color: lightTextColor),
                          decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: lightTextColor),
                              fillColor: textFieldColor,
                              filled: true),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: borderRadius),
                margin: const EdgeInsets.all(8),
                // padding: EdgeInsets.all(8),
                child: enableAnimatedContainer
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextButton(
                              onTap: () {},
                              isGradient: true,
                              text: 'All Activity',
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(Utilities.borderRadius),
                                  topRight:
                                      Radius.circular(Utilities.borderRadius)),
                              enableMargin: false),
                          CustomTextButton(
                              onTap: () {},
                              enableMargin: false,
                              isGradient: false,
                              text: 'System'),
                          CustomTextButton(
                              onTap: () {},
                              isGradient: false,
                              enableMargin: false,
                              text: 'Message'),
                          CustomTextButton(
                            onTap: () {},
                            isGradient: false,
                            text: 'Content',
                            enableMargin: false,
                            borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(Utilities.borderRadius),
                                bottomRight:
                                    Radius.circular(Utilities.borderRadius)),
                          ),
                        ],
                      )
                    : Container(),
              ),
              const Text('notifications'),
              NotificationPage(notification: notification),
              const Text('Messages'),
              MessagesPage(
                notification: notification,
                messages: messages,
              ),
            ],
          )
          // TabBarView(
          //   children: <Widget>[
          //     FadedSlideAnimation(
          //       child: NotificationPage(notification: notification),
          //       beginOffset: const Offset(0, 0.3),
          //       endOffset: const Offset(0, 0),
          //       slideCurve: Curves.linearToEaseOut,
          //     ),
          //     FadedSlideAnimation(
          //       child:
          //           MessagesPage(notification: notification, messages: messages),
          //       beginOffset: const Offset(0, 0.3),
          //       endOffset: const Offset(0, 0),
          //       slideCurve: Curves.linearToEaseOut,
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final List<Notif> notification;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemCount: widget.notification.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(widget.notification[index].image)),
                  title: Text(
                    widget.notification[index].name,
                    style: TextStyle(color: secondaryColor),
                  ),
                  subtitle: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: widget.notification[index].desc! + ' ',
                      style: TextStyle(color: lightTextColor),
                    ),
                    TextSpan(
                        text: widget.notification[index].time,
                        style:
                            TextStyle(color: lightTextColor.withOpacity(0.15)))
                  ])),
                  trailing: SizedBox(
                    width: 50,
                    //height: 45,
                    child: widget.notification[index].icon == Icons.add
                        ? const CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage('assets/images/user.webp'),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                        widget.notification[index].notifImage),
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
                        widget.notification[index].icon,
                        color: Colors.white,
                        size: 10,
                      ),
                      radius: 10,
                    )),
              ]);
            }),
      ],
    );
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
        physics: const NeverScrollableScrollPhysics(),
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
