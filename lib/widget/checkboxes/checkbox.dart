import 'package:common/enums/enums.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final CheckboxShape shape;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.shape = CheckboxShape.square,
  });

  @override
  Widget build(BuildContext context) {
    const double containerDimensions = 24;
    const double padding = 16;
    const double borderRadius = 5;
    const double containerPadding = 3;
    const double iconSize = 14;
    const double borderWidth = 2;

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: InkWell(
        onTap: () => onChanged(value),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: shape == CheckboxShape.round
                ? BorderRadius.circular(containerDimensions)
                : BorderRadius.circular(borderRadius),
            shape: shape == CheckboxShape.round
                ? BoxShape.circle
                : BoxShape.rectangle,
            color: value
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            border: Border.all(
              width: borderWidth,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          width: containerDimensions,
          height: containerDimensions,
          padding: const EdgeInsets.all(containerPadding),
          child: value
              ? const Icon(
                  Icons.check,
                  size: iconSize,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
