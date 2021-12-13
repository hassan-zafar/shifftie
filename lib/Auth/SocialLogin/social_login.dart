import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Auth/login_navigator.dart';
import 'package:shifftie/Components/continue_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  _SocialLoginState createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: AppBar(
          flexibleSpace: Column(
            children: <Widget>[
              const Spacer(),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.webp'),
                radius: 40,
              ),
              Text(
                '\n' + locale.changeProfilePic!,
                style: TextStyle(color: disabledTextColor),
              ),
            ],
          ),
        ),
      ),
      body: FadedSlideAnimation(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 16.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  locale.comment6!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12.0),
              EntryField(
                label: AppLocalizations.of(context)!.phoneNumber,
                initialValue: "+919876543210",
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              CustomButton(
                onPressed: () =>
                    Navigator.pushNamed(context, LoginRoutes.verification),
              ),
            ],
          ),
        ),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
