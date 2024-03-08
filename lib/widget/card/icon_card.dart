import 'package:flutter/material.dart';

enum FooterSize { small, medium, large }

enum IconAlignment { left, right, top }

enum TextSizeFooter { small, medium, large }

class IconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final FooterSize size;
  final IconAlignment iconAlignment;
  final TextSizeFooter textSize;
  final Color backgroundColor;
  final Color iconColor;

  const IconCard({
    super.key,
    required this.icon,
    required this.text,
    this.size = FooterSize.medium,
    this.iconAlignment = IconAlignment.left,
    this.textSize = TextSizeFooter.medium,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.black,
  });

  double _getSizeValue(FooterSize size, BuildContext context) {
    switch (size) {
      case FooterSize.small:
        return MediaQuery.of(context).size.width * 0.2;
      case FooterSize.medium:
        return MediaQuery.of(context).size.width * 0.5;
      case FooterSize.large:
        return MediaQuery.of(context).size.width * 0.8;
    }
  }

  double _getTextSizeFooter(TextSizeFooter textSize) {
    switch (textSize) {
      case TextSizeFooter.small:
        return 8.0;
      case TextSizeFooter.medium:
        return 16.0;
      case TextSizeFooter.large:
        return 32.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getSizeValue(size, context),
      color: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: _getTextSizeFooter(textSize),
            color: iconColor,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: _getTextSizeFooter(textSize),
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
