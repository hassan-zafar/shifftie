import 'package:flutter/material.dart';
import 'package:shifftie/Auth/interests_page.dart';
import 'package:shifftie/Auth/name_page.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Theme/colors.dart';

class PronounPage extends StatefulWidget {
  const PronounPage({Key? key}) : super(key: key);

  @override
  _PronounPageState createState() => _PronounPageState();
}

class _PronounPageState extends State<PronounPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 80,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: textFieldColor),
                  child: const Text('2'),
                ),
                Positioned(
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: textFieldColor),
                    child: const Text('3'),
                  ),
                ),
                Positioned(
                  left: -20,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [btnGradLeft, btnGradRight],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Text('1'),
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
            "Your Pronouns",
            // textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: lightTextColor),
          ),
          Text(
            'This helps us find you more relevant content',
            // textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/video 2.png',
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('He,His,Him'),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/video 2.png',
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("She,Her Her's"),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
                onTap: () {}, isGradient: false, text: 'They, Them, It'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InterestPage(),
                  ));
                },
                isGradient: true,
                text: 'Next Step'),
          ),
        ],
      ),
    );
  }
}
