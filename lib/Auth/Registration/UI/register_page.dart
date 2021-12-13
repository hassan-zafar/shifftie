import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
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
            Text('back'),
          ],
        ),
      ),

      //this column contains 3 textFields and a bottom bar
      body: FadedSlideAnimation(
        child: const RegisterForm(),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: transparentColor),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        height: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const Spacer(),

            //continue button
            CustomTextButton(
                text: 'Start Your Account',isGradient: true,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PronounPage(),
                  ));
                }),
            const Text(
              'Or',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
