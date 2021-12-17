import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/utilities.dart';

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;

  UnicornOutlineButton({
    Key? key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required VoidCallback onPressed,
  })  : this._painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child,
        this._callback = onPressed,
        this._radius = radius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            constraints: BoxConstraints(minWidth: 88, minHeight: 48),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      // TODO: implement shouldRepaint
      throw UnimplementedError();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;
  final double? height;
  final double? width;

  const MyOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
    this.gradient,
    this.width,
    this.height,
    this.thickness = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(Utilities.borderRadius)),
      child: Container(
        height: height ?? 68,
        width: width ?? 158,
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(Utilities.borderRadius)),
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: child,
        ),
      ),
    );
  }
}
