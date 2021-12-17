import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';
import 'package:shifftie/Auth/Login/UI/login_page.dart';
import 'package:shifftie/Auth/Registration/UI/register_page.dart';
import 'package:shifftie/Components/custom_text_button.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/curstom_unicorn_button.dart';
import 'package:shifftie/utilities/utilities.dart';

class WelcomescreenWidget extends StatelessWidget {
  const WelcomescreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator WelcomescreenWidget - FRAME
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 197,
                    left: -71,
                    child: Container(
                        width: 218,
                        height: 220,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Ellipse3000.png'),
                              fit: BoxFit.fitWidth),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(218, 220)),
                        ))),
                Positioned(
                    top: 73,
                    left: 184,
                    child: Container(
                        width: 218,
                        height: 218,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Ellipse3001.png'),
                              fit: BoxFit.fitWidth),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(218, 218)),
                        ))),
                Positioned(
                    top: 328,
                    left: 226,
                    child: Container(
                        width: 218,
                        height: 218,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Ellipse3002.png'),
                              fit: BoxFit.fitWidth),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(218, 218)),
                        ))),
                Positioned(
                  top: 389,
                  left: 18,
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 12,
                            left: 12,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                    // color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    top: 3.997997760772705,
                                    left: 2,
                                    child: SvgPicture.asset(
                                        'assets/icons/share_Icon.svg',
                                        semanticsLabel: 'icon'),
                                  ),
                                ]))),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 261,
                    left: 315,
                    child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 12,
                              left: -12,
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(),
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                      top: 3.997997760772705,
                                      left: 2,
                                      child: SvgPicture.asset(
                                          'assets/icons/share_Icon.svg',
                                          semanticsLabel: 'icon'),
                                    ),
                                  ]))),
                        ]))),
                Positioned(
                    top: 417,
                    left: 248,
                    child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Transform.rotate(
                              angle: -180 * (math.pi / 180),
                              child: SvgPicture.asset(
                                  'assets/images/backgroundcolor.svg',
                                  semanticsLabel: 'backgroundcolor'),
                            ),
                          ),
                          Positioned(
                              top: 12,
                              left: -12,
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                      top: 3.997997760772705,
                                      left: 2,
                                      child: SvgPicture.asset(
                                          'assets/icons/share_Icon.svg',
                                          semanticsLabel: 'icon'),
                                    ),
                                  ]))),
                        ]))),
                const Positioned(
                    top: 536,
                    left: 24,
                    child: Text(
                      'Direct the Story. Shift the Ending.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Spartan',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              },
              text: 'Login',
              isGradient: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyOutlinedButton(
              onPressed: () {},
              gradient: LinearGradient(colors: [btnGradLeft, btnGradRight]),
              child: Text(
                'Sign Up',
                style: TextStyle(color: btnGradLeft, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
