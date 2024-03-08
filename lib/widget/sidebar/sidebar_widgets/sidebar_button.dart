import 'package:flutter/material.dart';

class SidebarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData leadingIcon;
  final String label;

  const SidebarButton({
    Key? key,
    required this.leadingIcon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 50;
    const double iconSize = 28;
    const double fontSize = 20;
    const int textLines = 1;
    const double iconMargin = 10;
    Color iconColor = Theme.of(context).colorScheme.primary;

    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: onPressed,
      child: SizedBox(
        height: buttonHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: iconMargin,
            ),
            Icon(
              leadingIcon,
              size: iconSize,
              color: iconColor,
            ),
            Flexible(
              child: Text(
                "  $label",
                style: const TextStyle(fontSize: fontSize),
                maxLines: textLines,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
