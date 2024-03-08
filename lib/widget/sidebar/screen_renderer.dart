import 'package:common/widget/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class ScreenRenderer extends StatefulWidget {
  final Widget child;
  final String imagePath;
  const ScreenRenderer({
    super.key,
    required this.child,
    required this.imagePath,
  });

  @override
  State<ScreenRenderer> createState() => _ScreenRendererState();
}

class _ScreenRendererState extends State<ScreenRenderer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MySidebar(
            imagePath: widget.imagePath,
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
