import 'package:flutter/material.dart';
import 'package:shifftie/Auth/name_page.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/utilities.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  double paddingHor = 24;
  double paddingVert = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 80,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: textFieldColor),
                    child: const Text('3'),
                  ),
                ),
                Positioned(
                  left: -20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: textFieldColor),
                    child: const Text('1'),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [btnGradLeft, btnGradRight],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Text('2'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "What are you interested in?",
            // textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: lightTextColor),
          ),
          Text(
            'Choose a few categories you like you can change them later',
            // textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextButtonIntr(
                  onTap: () {},
                  isGradient: true,
                  text: '#Holidays',
                  paddingHor: paddingHor,
                  paddingVert: paddingVert,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextButtonIntr(
                  onTap: () {},
                  isGradient: false,
                  text: '#Animals',
                  paddingHor: paddingHor,
                  paddingVert: paddingVert,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButtonIntr(
                onTap: () {},
                isGradient: true,
                text: '#Havefun',
                paddingHor: paddingHor,
                paddingVert: paddingVert,
              ),
              CustomTextButtonIntr(
                onTap: () {},
                isGradient: true,
                text: '#Designers',
                paddingHor: paddingHor,
                paddingVert: paddingVert,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButtonIntr(
                onTap: () {},
                isGradient: false,
                text: '#4like4like',
                paddingHor: paddingHor,
                paddingVert: paddingVert,
              ),
              CustomTextButtonIntr(
                onTap: () {},
                isGradient: false,
                text: '#Engineering',
                paddingHor: paddingHor,
                paddingVert: paddingVert,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButtonIntr(
                onTap: () {},
                isGradient: true,
                text: '#Musiccover',
                paddingHor: paddingHor,
                paddingVert: paddingVert,
              ),
              CustomTextButtonIntr(
                onTap: () {},
                isGradient: false,
                text: '#Abstract',
                paddingHor: paddingHor,
                paddingVert: paddingVert,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NamePage(),
                  ));
                },
                isGradient: true,
                text: 'Next Step'),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextButtonIntr extends StatefulWidget {
  CustomTextButtonIntr(
      {required this.onTap,
      required this.isGradient,
      required this.text,
      this.paddingHor,
      this.paddingVert,
      this.height,
      this.fontSize,
      this.width,
      this.isInGridTile = false,
      this.color,
      Key? key})
      : super(key: key);
  final String text;
  final double? paddingVert;
  final double? paddingHor;
  final double? height;
  final double? width;
  final double? fontSize;
  bool isInGridTile;
  final Color? color;
  bool? isGradient = true;
  final VoidCallback onTap;

  @override
  State<CustomTextButtonIntr> createState() => _CustomTextButtonIntrState();
}

class _CustomTextButtonIntrState extends State<CustomTextButtonIntr> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 70, width: widget.width ?? 160,
        margin: EdgeInsets.symmetric(vertical: Utilities.padding / 2),
        // padding: EdgeInsets.symmetric(
        //   vertical: widget.paddingVert ?? Utilities.padding,
        //   horizontal: widget.paddingHor ?? Utilities.padding * 3,
        // ),
        decoration: BoxDecoration(
          color: widget.color ?? textFieldColor,
          gradient: widget.isGradient!
              ? LinearGradient(
                  colors: [btnGradLeft, btnGradRight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
              : null,
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
        ),
        child: Center(
          child: widget.isInGridTile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: lightTextColor,
                        letterSpacing: 1,
                        fontSize: widget.fontSize ?? 22,
                      ),
                    ),
                    Icon(
                      Icons.thumb_up,
                      color: lightTextColor,
                    )
                  ],
                )
              : Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: lightTextColor,
                    letterSpacing: 1,
                    fontSize: widget.fontSize ?? 22,
                  ),
                ),
        ),
      ),
    );
  }
}
