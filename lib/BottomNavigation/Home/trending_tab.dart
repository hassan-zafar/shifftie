import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Auth/login_navigator.dart';
import 'package:shifftie/BottomNavigation/Home/comment_sheet.dart';
import 'package:shifftie/Components/custom_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Components/rotated_image.dart';
import 'package:shifftie/Constants/constants.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Theme/constants.dart';
import 'package:video_player/video_player.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class TrendingTabPage extends StatelessWidget {
  final List<String> videos;
  final List<String> images;
  final bool isFollowing;

  final int? variable;

  const TrendingTabPage(this.videos, this.images, this.isFollowing,
      {Key? key, this.variable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowingTabBody(videos, images, isFollowing, variable);
  }
}

class FollowingTabBody extends StatefulWidget {
  final List<String> videos;
  final List<String> images;

  final bool isFollowing;
  final int? variable;

  const FollowingTabBody(
      this.videos, this.images, this.isFollowing, this.variable,
      {Key? key})
      : super(key: key);

  @override
  _FollowingTabBodyState createState() => _FollowingTabBodyState();
}

class _FollowingTabBodyState extends State<FollowingTabBody> {
  PageController? _pageController;
  int current = 0;
  bool isOnPageTurning = false;

  void scrollListener() {
    if (isOnPageTurning &&
        _pageController!.page == _pageController!.page!.roundToDouble()) {
      setState(() {
        current = _pageController!.page!.toInt();
        isOnPageTurning = false;
      });
    } else if (!isOnPageTurning &&
        current.toDouble() != _pageController!.page) {
      if ((current.toDouble() - _pageController!.page!).abs() > 0.1) {
        setState(() {
          isOnPageTurning = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController!.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemBuilder: (context, position) {
        return VideoPage(
          widget.videos[position],
          widget.images[position],
          pageIndex: position,
          currentPageIndex: current,
          isPaused: isOnPageTurning,
          isFollowing: widget.isFollowing,
        );
      },
      onPageChanged: widget.variable == null
          ? (i) async {
              if (i == 2) {
                await showModalBottomSheet(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: transparentColor),
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16.0))),
                  context: context,
                  isScrollControlled: true,
                  isDismissible: false,
                  builder: (context) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.width * 1.2,
                        child: const LoginNavigator());
                  },
                );
              }
            }
          : null,
      itemCount: widget.videos.length,
    );
  }
}

class VideoPage extends StatefulWidget {
  final String video;
  final String image;
  final int? pageIndex;
  final int? currentPageIndex;
  final bool? isPaused;
  final bool? isFollowing;

  const VideoPage(this.video, this.image,
      {Key? key,
      this.pageIndex,
      this.currentPageIndex,
      this.isPaused,
      this.isFollowing})
      : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with RouteAware {
  late VideoPlayerController _controller;
  bool initialized = false;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video)
      ..initialize().then((value) {
        setState(() {
          _controller.setLooping(true);
          initialized = true;
        });
      });
  }

  @override
  void didPopNext() {
    // ignore: avoid_print
    print("didPopNext");
    _controller.play();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    // ignore: avoid_print
    print("didPushNext");
    _controller.pause();
    super.didPushNext();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>); //Subscribe it here
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageIndex == widget.currentPageIndex &&
        !widget.isPaused! &&
        initialized) {
      _controller.play();
    } else {
      _controller.pause();
    }
    var locale = AppLocalizations.of(context)!;
//    if (_controller.value.position == _controller.value.duration) {
//      setState(() {
//      });
//    }
    if (widget.pageIndex == 2) _controller.pause();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            },
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : const SizedBox.shrink(),
          ),
          Positioned(
            top: 70,
            left: -70,
            child: InkWell(
              onTap: () {
                _controller.pause();
                Navigator.pushNamed(context, PageRoutes.userProfilePage);
              },
              child: CircleAvatar(
                backgroundImage: const AssetImage(
                  'assets/images/user.webp',
                ),
                radius: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Icon(Icons.reply)),
                    Text('  Previous Shift'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: -70,
            child: InkWell(
              onTap: () {
                _controller.pause();
                Navigator.pushNamed(context, PageRoutes.userProfilePage);
              },
              child: CircleAvatar(
                backgroundImage: const AssetImage(
                  'assets/images/user.webp',
                ),
                radius: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Icon(Icons.reply)),
                    Text('  Previous Shift'),
                  ],
                ),
              ),
            ),
          ),
          Positioned.directional(
              textDirection: Directionality.of(context),
              end: 60.0,
              bottom: 150.0,
              child: Container(
                width: 280,
                height: 170,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          gradient: LinearGradient(
                              colors: [btnGradLeft, btnGradRight])),
                      width: double.maxFinite,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'What should our next shift include',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextButtonIntr(
                            onTap: () {},
                            isGradient: true,
                            paddingHor: 8,
                            width: 120,
                            height: 40,
                            paddingVert: 8,
                            text: "I want you to eat keyboard",
                            fontSize: 12,
                          ),
                          CustomTextButtonIntr(
                            onTap: () {},
                            isGradient: false,
                            paddingHor: 8,
                            width: 120,
                            height: 40,
                            paddingVert: 8,
                            text: "I want you to eat keyboard",
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextButtonIntr(
                            onTap: () {},
                            isGradient: false,
                            paddingHor: 8,
                            width: 120,
                            height: 40,
                            paddingVert: 8,
                            text: "I want you to eat keyboard",
                            fontSize: 12,
                          ),
                          CustomTextButtonIntr(
                            onTap: () {},
                            isGradient: false,
                            paddingHor: 8,
                            width: 120,
                            height: 40,
                            paddingVert: 8,
                            text: "I want you to eat keyboard",
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: -10.0,
            bottom: 80.0,
            child: Column(
              children: <Widget>[
                // CustomButton(
                //   ImageIcon(
                //     const AssetImage('assets/icons/ic_views.png'),
                //     color: secondaryColor,
                //   ),
                //   '1.2k',
                // ),
                CustomButton(
                    ImageIcon(
                      const AssetImage('assets/icons/ic_comment.png'),
                      color: secondaryColor,
                    ),
                    '287', onPressed: () {
                  commentSheet(context);
                }),
                CustomButton(
                  Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: secondaryColor,
                  ),
                  '8.2k',
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ],
            ),
          ),
          widget.isFollowing!
              ? Positioned.directional(
                  textDirection: Directionality.of(context),
                  end: 27.0,
                  bottom: 320.0,
                  child: CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 8,
                      child: Icon(
                        Icons.add,
                        color: secondaryColor,
                        size: 12.0,
                      )),
                )
              : const SizedBox.shrink(),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(bottom: 60.0),
                child: LinearProgressIndicator(
                    //minHeight: 1,
                    )),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 70.0,
            top: 72.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RotatedImage(widget.image),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: '@emiliwilliamson\n',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5)),
                    TextSpan(text: locale.comment8),
                    TextSpan(
                        text: '  ${locale.seeMore}',
                        style: TextStyle(
                            color: secondaryColor.withOpacity(0.5),
                            fontStyle: FontStyle.italic))
                  ]),
                ),
                CustomTextButtonIntr(
                    fontSize: 12,
                    width: 120,
                    height: 50,
                    onTap: () {},
                    isGradient: true,
                    text: 'Subscribe \$9/Mo')
              ],
            ),
          )
        ],
      ),
    );
  }

}
