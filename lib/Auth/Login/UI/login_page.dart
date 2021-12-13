import 'package:flutter/material.dart';
import 'package:shifftie/Auth/Registration/UI/register_page.dart';
import 'package:shifftie/Auth/login_navigator.dart';
import 'package:shifftie/Components/continue_button.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Text(
            'Welcome Back',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: secondaryColor, fontWeight: FontWeight.bold),
          ),
          const EntryField(
            label: "Email@youremail.com",
          ),
          const EntryField(
            label: "Password",
          ),
          // CustomTextFormField(
          //     title: 'Enter', controller: TextEditingController()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      fillColor: MaterialStateProperty.all(textFieldColor),
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
            ],
          ),

          CustomTextButton(
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.bottomNavigation),
            text: 'Login',
            isGradient: true,
          ),

          const Text(
            'Or',
            textAlign: TextAlign.center,
          ),
          // const Spacer(),
          CustomButton(
            icon: Image.asset(
              'assets/icons/ic_fb.png',
              height: 20,
            ),
            text: '   ${AppLocalizations.of(context)!.facebookAccount}',
            color: fbColor,
            onPressed: () =>
                Navigator.pushNamed(context, LoginRoutes.socialLogin),
          ),
          CustomButton(
            icon: Image.asset(
              'assets/icons/ic_ggl.png',
              height: 20,
            ),
            text: '   ${AppLocalizations.of(context)!.googleAccount}',
            color: secondaryColor,
            textColor: darkColor,
            onPressed: () =>
                Navigator.pushNamed(context, LoginRoutes.socialLogin),
          ),
          //         const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              splashColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ));
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Don't have an account? ",
                  // style:
                  // TextStyle(color: Colors),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'SIGN UP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
