import 'package:flutter/material.dart';

class SideBarLogo extends StatelessWidget {
  final double width;
  final Duration animationDuration;
  final String imagePath;

  const SideBarLogo({
    super.key,
    required this.width,
    required this.animationDuration,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("/");
        },
        mouseCursor: SystemMouseCursors.help,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
