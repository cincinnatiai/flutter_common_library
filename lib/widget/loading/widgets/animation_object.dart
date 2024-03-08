import 'package:flutter/material.dart';

class AnimationObject extends StatelessWidget {
  final Animation<double> opacityAnimation;
  final String imagePath;
  final Color backColor;

  const AnimationObject(
      {super.key,
      required this.opacityAnimation,
      required this.imagePath,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    const double containerCircleDiameter = 90;
    Color containerColor = backColor;
    const double logoScale = 0.7;
    return Container(
      width: containerCircleDiameter,
      height: containerCircleDiameter,
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: opacityAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: opacityAnimation.value,
              child: child,
            );
          },
          child: Transform.scale(
            scale: logoScale,
            child: Image.asset(
              imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
