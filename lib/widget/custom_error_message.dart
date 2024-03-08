import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  final String message;
  const CustomErrorMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DimensCommon.four),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontSize: DimensCommon.fontSizeError,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
