import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Auth/pronoun_page.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Theme/colors.dart';

//register page for registration of a new user
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: const [
            Icon(Icons.arrow_back_ios_sharp),
          ],
        ),
      ),

      //this column contains 3 textFields and a bottom bar
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Shift Your Friend's Stories",
              // textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: lightTextColor),
            ),
            Text(
              'asd',
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            //name textField

            const EntryField(
              textCapitalization: TextCapitalization.words,
              label: 'Email@yourmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
            //email textField
            const EntryField(
              textCapitalization: TextCapitalization.none,
              label: 'Password',
            ),

            //phone textField
            const EntryField(
              textCapitalization: TextCapitalization.none,
              label: 'Re-type Your Password',
            ),

            //continue button
            CustomTextButton(
                text: 'Start Your Account',
                isGradient: true,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PronounPage(),
                  ));
                }),
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
                    color: Color(0xff1E81C9),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PronounPage(),
                      ));
                    }),
                CustomTextButtonIntr(
                    text: 'Google',
                    width: 140,
                    color: Colors.green,
                    isGradient: false,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PronounPage(),
                      ));
                    }),
              ],
            )
          ],
        ),
      ),
      // FadedSlideAnimation(
      //   child: const RegisterForm(),
      //   beginOffset: const Offset(0, 0.3),
      //   endOffset: const Offset(0, 0),
      //   slideCurve: Curves.linearToEaseOut,
      // ),
    );
  }
}
