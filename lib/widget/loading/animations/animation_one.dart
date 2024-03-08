import 'package:common/widget/loading/widgets/animation_object.dart';
import 'package:flutter/material.dart';

class AnimationOne extends StatelessWidget {
  final Animation<double> opacityAnimation;
  final String imagePath;
  final Color backColor;

  const AnimationOne({
    super.key,
    required this.opacityAnimation,
    required this.imagePath,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: opacityAnimation.value,
          child: child,
        );
      },
      child: AnimationObject(
        opacityAnimation: opacityAnimation,
        imagePath: imagePath,
        backColor: backColor,
      ),
    );
  }
}
