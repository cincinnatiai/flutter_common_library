import 'package:common/widget/loading/animations/animation_one.dart';
import 'package:common/widget/loading/animations/animation_two.dart';
import 'package:flutter/material.dart';

enum AnimationType { logoBlink, objectBlink }

class CustomProgressWidget extends StatefulWidget {
  final AnimationType? animationType;
  final bool? startAnimation;
  final String imagePath;
  final Color? backgroundColor;

  const CustomProgressWidget({
    super.key,
    this.animationType = AnimationType.logoBlink,
    this.startAnimation = true,
    required this.imagePath,
    this.backgroundColor = Colors.transparent,
  });

  @override
  State<CustomProgressWidget> createState() => _CustomProgressWidgetState();
}

class _CustomProgressWidgetState extends State<CustomProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  static int animationTime = 2;
  static double finalSecond = 1.0;
  static double inicialSecond = 0.0;
  static double animationWidth = 0.5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationTime),
    );

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: finalSecond, end: inicialSecond),
        weight: animationWidth,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: inicialSecond, end: finalSecond),
        weight: animationWidth,
      ),
    ]).animate(_controller);

    if (widget.startAnimation!) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant CustomProgressWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startAnimation!) {
      _controller.repeat(reverse: true);
    } else {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget initializeAnimation(
      AnimationType type, Animation<double> opacityAnimation) {
    switch (type) {
      case AnimationType.objectBlink:
        return AnimationOne(
          opacityAnimation: opacityAnimation,
          imagePath: widget.imagePath,
          backColor: widget.backgroundColor!,
        );
      case AnimationType.logoBlink:
        return AnimationTwo(
          opacityAnimation: opacityAnimation,
          imagePath: widget.imagePath,
          backColor: widget.backgroundColor!,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return initializeAnimation(widget.animationType!, _opacityAnimation);
  }
}
