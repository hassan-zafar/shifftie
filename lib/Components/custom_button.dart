import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';

class CustomButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function? onPressed;

   const CustomButton(this.icon, this.text, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: transparentColor,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: <Widget>[
          icon,
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: secondaryColor),
          )
        ],
      ),
      onPressed: onPressed as void Function()?,
    );
  }
}
