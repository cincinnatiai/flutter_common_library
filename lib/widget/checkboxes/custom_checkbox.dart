import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool parentValue;
  final Function(bool value) onChange;

  const CustomCheckbox({
    super.key,
    required this.parentValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Checkbox(
      activeColor: themeData.colorScheme.primary,
      value: parentValue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DimensCommon.borderRadius),
      ),
      side: MaterialStateBorderSide.resolveWith((states) => BorderSide(
          width: DimensCommon.borderWidth,
          color: themeData.colorScheme.primaryContainer)),
      onChanged: (value) {
        if (value != null) {
          onChange(value);
        }
      },
    );
  }
}
