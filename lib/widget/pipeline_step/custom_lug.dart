import 'package:flutter/material.dart';

class CustomContainerLug extends StatelessWidget {
  const CustomContainerLug({
    super.key,
    this.containerHeight,
    required this.lugColor,
    required this.borderRadious,
  });

  final double? containerHeight;
  final Color lugColor;
  final double borderRadious;

  @override
  Widget build(BuildContext context) {
    const double lugWidth = 31;
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      child: Container(
        height: (containerHeight != null) ? containerHeight : null,
        width: lugWidth,
        decoration: BoxDecoration(
            color: lugColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadious),
              bottomLeft: Radius.circular(borderRadious),
            )),
        child: const Icon(Icons.apps),
      ),
    );
  }
}
