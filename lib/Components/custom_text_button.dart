import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/utilities.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {required this.onTap,
      required this.isGradient,
      required this.text,
      this.paddingHor,
      this.enableMargin = true,
      this.textAlign,
      this.borderRadius,
      this.paddingVert,
      // this.isdropDown,
      Key? key})
      : super(key: key);
  final String text;
  final double? paddingVert;
  final double? paddingHor;
  final borderRadius;
  final TextAlign? textAlign;
  bool isdropDown = false;
  final bool enableMargin;
  bool? isGradient = true;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: enableMargin
            ? EdgeInsets.symmetric(vertical: Utilities.padding / 2)
            : null,
        padding: EdgeInsets.symmetric(
          vertical: paddingVert ?? Utilities.padding,
          horizontal: paddingHor ?? Utilities.padding * 3,
        ),
        decoration: BoxDecoration(
          color: textFieldColor,
          gradient: isGradient!
              ? LinearGradient(
                  colors: [btnGradLeft, btnGradRight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
              : null,
          borderRadius: enableMargin
              ? BorderRadius.circular(Utilities.borderRadius)
              : borderRadius,
        ),
        child: isdropDown
            ? Row(
                children: [
                  Text(
                    text,
                    textAlign: textAlign ?? TextAlign.center,
                    style: TextStyle(
                      color: lightTextColor,
                      letterSpacing: 1,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                textAlign: textAlign ?? TextAlign.center,
                style: TextStyle(
                  color: lightTextColor,
                  letterSpacing: 1,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
