import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';
import 'package:shifftie/Theme/colors.dart';

class WelcomescreenWidget extends StatelessWidget {
  const WelcomescreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator WelcomescreenWidget - FRAME
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 375,
              height: 554,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0.0007987543940544128, 0.8895759582519531),
                    end: Alignment(-0.8895759582519531, 0.0010551282903179526),
                    colors: [
                      Color.fromRGBO(22, 23, 27, 0.699999988079071),
                      Color.fromRGBO(22, 23, 27, 0.9900000095367432),
                      Color.fromRGBO(22, 23, 27, 1)
                    ]),
              ))),
      Positioned(
          top: 554,
          left: 0,
          child: Container(
              width: 375,
              height: 258,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(22, 23, 27, 1),
              ))),
      Positioned(
          top: 778,
          left: 0,
          child: Container(
              width: 375,
              height: 34,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(children: <Widget>[
                Positioned(
                  top: 20,
                  left: 121,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [btnGradLeft, btnGradRight]),
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ]))),
      Positioned(
          top: 51,
          left: 24,
          child: SizedBox(
              width: 195.7794189453125,
              height: 42,
              child: Stack(children: <Widget>[]))),
      Positioned(
          top: 197,
          left: -71,
          child: Container(
              width: 218,
              height: 220,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(196, 196, 196, 1),
                image: DecorationImage(
                    image: AssetImage('assets/images/Ellipse3000.png'),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.all(Radius.elliptical(218, 220)),
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
                    image: AssetImage('assets/images/Ellipse3001.png'),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.all(Radius.elliptical(218, 218)),
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
                    image: AssetImage('assets/images/Ellipse3002.png'),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.all(Radius.elliptical(218, 218)),
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
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 3.997997760772705,
                          left: 2,
                          child: SvgPicture.asset('assets/icons/share_icon.svg',
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
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 3.997997760772705,
                            left: 2,
                            child: SvgPicture.asset(
                                'assets/icons/share_icon.svg',
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
                    child: SvgPicture.asset('assets/images/backgroundcolor.svg',
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
                                'assets/icons/share_icon.svg',
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
                fontSize: 32,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          )),
    ]));
  }
}
