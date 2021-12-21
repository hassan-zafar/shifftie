import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Auth/Registration/UI/register_page.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/DatabaseMethods/auth_methods.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/custom_toast.dart';
import 'package:shifftie/utilities/show_loading.dart';

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
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: secondaryColor, fontWeight: FontWeight.bold),
              ),
              EntryField(
                label: "Email@youremail.com",
                controller: _password,
              ),
              EntryField(
                label: "Password",
                controller: _email,
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
                onTap: () async {
                  if (_key.currentState!.validate()) {
                    showLoadingDislog(context);
                    final User? _user =
                        await AuthMethod().loginWithEmailAndPassword(
                      _email.text.trim(),
                      _password.text.trim(),
                    );
                    if (_user != null) {
                      Navigator.pushNamed(context, PageRoutes.bottomNavigation);
                    } else {
                      Navigator.of(context).pop();
                      CustomToast.errorToast(
                          message: 'email OR password in incorrect');
                    }
                  }
                },
                text: 'Login',
                isGradient: true,
              ),

              const Text(
                'Or',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextButtonIntr(
                      width: 140,
                      text: 'Facebook',
                      isGradient: false,
                      color: const Color(0xff1E81C9),
                      onTap: () {
                        Navigator.pushNamed(
                            context, PageRoutes.bottomNavigation);
                      }),
                  CustomTextButtonIntr(
                      text: 'Google',
                      width: 140,
                      color: Colors.green,
                      isGradient: false,
                      onTap: () {
                        Navigator.pushNamed(
                            context, PageRoutes.bottomNavigation);
                      }),
                ],
              ),
              // CustomButton(
              //   icon: Image.asset(
              //     'assets/icons/ic_fb.png',
              //     height: 20,
              //   ),
              //   text: '   ${AppLocalizations.of(context)!.facebookAccount}',
              //   color: fbColor,
              //   onPressed: () =>
              //       Navigator.pushNamed(context, LoginRoutes.socialLogin),
              // ),
              // CustomButton(
              //   icon: Image.asset(
              //     'assets/icons/ic_ggl.png',
              //     height: 20,
              //   ),
              //   text: '   ${AppLocalizations.of(context)!.googleAccount}',
              //   color: secondaryColor,
              //   textColor: darkColor,
              //   onPressed: () =>
              //       Navigator.pushNamed(context, LoginRoutes.socialLogin),
              // ),
              // //         const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  RegisterPage(),
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
          ),
        ),
      )),
    );
  }
}
