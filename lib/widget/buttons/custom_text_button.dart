import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String message;
  final Function() onPressed;
  const CustomTextButton({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onPressed(),
      child: Text(
        message,
        style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: DimensCommon.twelve,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
