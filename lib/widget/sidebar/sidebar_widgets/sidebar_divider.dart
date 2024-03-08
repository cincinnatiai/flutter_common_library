import 'package:flutter/material.dart';

class SidebarDivider extends StatelessWidget {
  const SidebarDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double dividerHeight = 2;
    Color dividerColor = Colors.grey[400]!;
    return Container(
      height: dividerHeight,
      decoration: BoxDecoration(color: dividerColor),
    );
  }
}
