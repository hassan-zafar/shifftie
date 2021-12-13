import 'package:flutter/material.dart';

class RotatedImage extends StatefulWidget {
  final String image;

  const RotatedImage(this.image, {Key? key}) : super(key: key);

  @override
  _RotatedImageState createState() => _RotatedImageState();
}

class _RotatedImageState extends State<RotatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3, milliseconds: 500),
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    if (widget.isPlaying) {
//      animationController.repeat();
//    } else {
//      animationController.stop();
//    }
    return RotationTransition(
      turns: animation,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/disk.png',
            scale: 2.2,
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 7.5,
            top: 7.5,
            child: Image.asset(
              widget.image,
              scale: 3,
            ),
          ),
        ],
      ),
    );
  }
}
