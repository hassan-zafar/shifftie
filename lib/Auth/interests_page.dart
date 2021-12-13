import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
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
        ],
      ),
    );
  }
}
