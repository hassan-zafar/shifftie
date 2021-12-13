import 'package:flutter/material.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: 80,
              child: Stack(
                clipBehavior: Clip.none, children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: textFieldColor),
                    child: const Text('2'),
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
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [btnGradLeft, btnGradRight],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Text('3'),
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
              "Tell us your name please",
              // textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: lightTextColor),
            ),
            Text(
              'This helps your friend to find your shifftie account',
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 30,
            ),
            const EntryField(
              label: "Your username",
            ),
            const EntryField(
              label: "Your real name",
            ),
            CustomTextButton(
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.bottomNavigation),
              text: 'Continue',
              isGradient: true,
            ),
          ],
        ),
      ),
    );
  }
}
