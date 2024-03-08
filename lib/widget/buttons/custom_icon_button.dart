import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon buttonIcon;
  final VoidCallback onTap;
  const CustomIconButton({
    super.key,
    required this.buttonIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double borderRadious = 6;
    const double buttonHeight = 39;
    const double buttonWidth = 41;
    const BoxShadow boxShadow = BoxShadow(
      color: Colors.grey,
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadious),
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            boxShadow,
          ],
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        child: buttonIcon,
      ),
    );
  }
}
