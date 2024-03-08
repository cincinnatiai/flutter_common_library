import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.iconSize,
    required this.indentifyingIcon,
    required this.iconColor,
    required this.title,
  });

  final double iconSize;
  final IconData indentifyingIcon;
  final Color iconColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          indentifyingIcon,
          size: iconSize,
          color: iconColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: DimensCommon.twelve),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
