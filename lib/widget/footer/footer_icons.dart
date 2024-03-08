import 'package:flutter/material.dart';

class FooterIcon extends StatelessWidget {
  final IconData? iconData;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;

  const FooterIcon({
    super.key,
    this.iconData,
    this.size,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double finalSize = size ?? 45.0;
    final IconData finalIconData = iconData ?? Icons.fingerprint;
    final Color finalColor = color ?? const Color(0xFF162A49);

    return SizedBox(
      width: finalSize,
      height: finalSize,
      child: Center(
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(finalSize / 2),
          ),
          child: IconButton(
            icon: Icon(
              finalIconData,
              size: finalSize * 0.5,
              color: finalColor,
            ),
            onPressed: onPressed ?? () {},
          ),
        ),
      ),
    );
  }
}
