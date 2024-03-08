import 'package:flutter/material.dart';

enum TextSize { small, medium, large }

enum Justify { center, left, right }

class CopyrightContainer extends StatelessWidget {
  final String? companyName;
  final String? copyright;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final TextSize? textSize;
  final Justify? alignment;

  const CopyrightContainer({
    super.key,
    this.alignment,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.textStyle,
    this.copyright,
    this.companyName = 'Cincinnati AI',
    this.textSize = TextSize.small,
  });

  double getTextSize(TextSize textSize) {
    switch (textSize) {
      case TextSize.small:
        return 12.0;
      case TextSize.medium:
        return 16.0;
      case TextSize.large:
        return 20.0;
      default:
        return 16.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment rowAlignment;
    var defaultCopyright =
        'Copyright $companyName © ${DateTime.now().year}, All Rights Reserved.';

    const defaultTextColor = Color(0xFF162A49);

    switch (alignment) {
      case Justify.left:
        rowAlignment = MainAxisAlignment.start;
        break;
      case Justify.right:
        rowAlignment = MainAxisAlignment.end;
        break;
      case Justify.center:
        rowAlignment = MainAxisAlignment.center;
        break;
      case null:
        rowAlignment = MainAxisAlignment.center;
        break;
    }
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: rowAlignment,
        children: <Widget>[
          Text(
            copyright ?? defaultCopyright,
            style: textStyle ??
                TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: getTextSize(textSize!),
                  color: textColor ?? defaultTextColor,
                ),
          ),
        ],
      ),
    );
  }
}
