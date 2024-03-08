import 'package:common/widget/loading/widgets/animation_object.dart';
import 'package:flutter/material.dart';

class AnimationTwo extends StatelessWidget {
  final Animation<double> opacityAnimation;
  final String imagePath;
  final Color backColor;

  const AnimationTwo({
    super.key,
    required this.opacityAnimation,
    required this.imagePath,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationObject(
      opacityAnimation: opacityAnimation,
      imagePath: imagePath,
      backColor: backColor,
    );
  }
}
