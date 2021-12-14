import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Components/continue_button.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';

class AddVideoFilter extends StatefulWidget {
  const AddVideoFilter({Key? key}) : super(key: key);

  @override
  _AddVideoFilterState createState() => _AddVideoFilterState();
}

class _AddVideoFilterState extends State<AddVideoFilter> {
  List<String> images = [
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
    'assets/images/video 2.png',
  ];

  List<Color?> color = [
    const Color(0xff7c94b6),
    Colors.orange[200],
    Colors.grey[300],
    Colors.grey[400],
    Colors.blueAccent[400],
    Colors.blueGrey[400],
    Colors.grey[300],
    Colors.blueGrey[400],
  ];

  List<BlendMode> blendMode = [
    BlendMode.dstATop,
    BlendMode.dst,
    BlendMode.hue,
    BlendMode.hardLight,
    BlendMode.modulate,
    BlendMode.dstATop,
    BlendMode.hardLight,
    BlendMode.darken,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/video 2.png',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        AppBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 72,
            margin: const EdgeInsets.only(bottom: 78.0, left: 12.0, right: 12),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return FadedScaleAnimation(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  color[index]!, blendMode[index]),
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover)),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 72,
                      width: 72,
                      //child: Image.asset(images[index], fit: BoxFit.fill,),
                    ),
                  );
                }),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: <Widget>[
                CustomButton(
                  color: transparentColor,
                  icon: Icon(
                    Icons.music_note,
                    color: secondaryColor,
                  ),
                  text: AppLocalizations.of(context)!.addMusic,
                  onPressed: () {},
                ),
                const Spacer(),
                CustomButton(
                  text: AppLocalizations.of(context)!.next,
                  onPressed: () =>
                      Navigator.pushNamed(context, PageRoutes.postInfoPage),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
