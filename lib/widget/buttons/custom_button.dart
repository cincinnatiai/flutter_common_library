import 'package:common/constants/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, white, blocked, whiteImpact, gradient }

enum Justify { center, left, right }

enum TextSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final ButtonType? buttonType;
  final Justify? alignment;
  final Color? borderColor;
  final Color? fillColor;
  final List<Color>? fillColors;
  final double? borderWidth;
  final double? width;
  final double? height;
  final Color? textColor;
  final Icon? icon;
  final VoidCallback? onPressed;
  final String buttonText;
  final TextSize? textSize;

  const CustomButton({
    this.buttonType = ButtonType.primary,
    this.alignment,
    this.borderColor,
    this.fillColor,
    this.fillColors,
    this.borderWidth,
    this.width,
    this.height,
    this.textColor,
    this.icon,
    required this.onPressed,
    required this.buttonText,
    this.textSize = TextSize.medium,
    super.key,
  });

  double getTextSize(TextSize textSize) {
    switch (textSize) {
      case TextSize.small:
        return DimensCommon.twelve;
      case TextSize.medium:
        return DimensCommon.sixteen;
      case TextSize.large:
        return DimensCommon.twenty;
      default:
        return DimensCommon.sixteen;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<Color> effectiveFillColor;
    Color effectiveBorderColor;
    Color effectiveTextColor;
    final effectiveBorderWidth = borderWidth ?? DimensCommon.borderWidth;
    final effectiveWidth = width ?? double.infinity;
    final effectiveHeight = height ?? 40;
    MainAxisAlignment rowAlignment;
    Color gradientColor2;
    Color gradientColor1;
    bool isGradientTheme = false;

    switch (buttonType) {
      case ButtonType.primary:
        effectiveBorderColor = theme.colorScheme.primary;
        effectiveFillColor = [theme.colorScheme.primary];
        effectiveTextColor = theme.colorScheme.onTertiaryContainer;
        break;
      case ButtonType.white:
        effectiveBorderColor = theme.colorScheme.onTertiaryContainer;
        effectiveFillColor = [theme.colorScheme.onTertiaryContainer];
        effectiveTextColor = theme.colorScheme.primary;
        break;
      case ButtonType.whiteImpact:
        effectiveBorderColor = theme.colorScheme.primary;
        effectiveFillColor = [theme.colorScheme.onTertiaryContainer];
        effectiveTextColor = theme.colorScheme.primary;
        break;
      case ButtonType.blocked:
        effectiveBorderColor = theme.colorScheme.tertiary;
        effectiveFillColor = [theme.colorScheme.tertiary];
        effectiveTextColor = theme.colorScheme.onTertiaryContainer;
        break;
      case ButtonType.gradient:
        isGradientTheme = true;
        gradientColor2 = const Color(0xFF0BBCAE);
        gradientColor1 = const Color(0xFF2A55D5);
        effectiveFillColor = [gradientColor1, gradientColor2];
        effectiveTextColor = Colors.white;
        effectiveBorderColor = Colors.transparent;
        break;
      case null:
        effectiveBorderColor = theme.colorScheme.primary;
        effectiveFillColor = [theme.colorScheme.primary];
        effectiveTextColor = theme.colorScheme.onTertiaryContainer;
        break;
    }

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
      width: effectiveWidth,
      height: effectiveHeight,
      decoration: BoxDecoration(
        color: isGradientTheme ? null : effectiveFillColor[0],
        gradient:
            isGradientTheme ? LinearGradient(colors: effectiveFillColor) : null,
        border: Border.all(
          color: effectiveBorderColor,
          width: effectiveBorderWidth,
        ),
        borderRadius: BorderRadius.circular(DimensCommon.borderRadius),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: rowAlignment,
          children: [
            Flexible(
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: effectiveTextColor,
                    fontSize: getTextSize(textSize!),
                    overflow: TextOverflow.fade),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
