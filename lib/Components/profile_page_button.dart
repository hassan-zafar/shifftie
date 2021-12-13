import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';

class ProfilePageButton extends StatelessWidget {
  final String? text;
  final Function onTap;
  final Color? color;
  final Color? textColor;
  final double? width;

  const ProfilePageButton(this.text, this.onTap,
      {Key? key, this.color, this.textColor, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        width: width ?? 84.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? backgroundColor,
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          text!,
          style: TextStyle(
              fontSize: 12,
              color: textColor ?? mainColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
