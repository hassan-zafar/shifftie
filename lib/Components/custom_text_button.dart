import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/utilities.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {required this.onTap,
      required this.isGradient,
      required this.text,
      Key? key})
      : super(key: key);
  final String text;
  bool? isGradient = true;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Utilities.padding / 2),
        padding: EdgeInsets.symmetric(
          vertical: Utilities.padding,
          horizontal: Utilities.padding * 3,
        ),
        decoration: BoxDecoration(
          color: textFieldColor,
          gradient: isGradient!
              ? LinearGradient(
                  colors: [btnGradLeft, btnGradRight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
              : null,
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
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
