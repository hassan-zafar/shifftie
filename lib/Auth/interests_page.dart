import 'package:flutter/material.dart';
import 'package:shifftie/Auth/name_page.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Theme/colors.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
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
        children: [
          Text(
            "What are you interested in?",
            // textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: lightTextColor),
          ),
          Text(
            'Choose a few categories you like you can change them later',
            // textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#Holidays'),
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#Animals'),
            ],
          ),
          Row(
            children: [
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#Havefun'),
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#Designers'),
            ],
          ),
          Row(
            children: [
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#4like4like'),
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#Engineering'),
            ],
          ),
          Row(
            children: [
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#Musiccover'),
              CustomTextButton(
                  onTap: () {}, isGradient: true, text: '#Abstract'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NamePage(),
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
