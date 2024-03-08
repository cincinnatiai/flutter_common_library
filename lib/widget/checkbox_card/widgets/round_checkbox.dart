import 'package:flutter/material.dart';

class RoundCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const RoundCheckbox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double containerDimentions = 24;
    const double containerPadding = 3;
    const double iconSize = 14;
    const double borderWidth = 2;
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          border: Border.all(
            width: borderWidth,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        width: containerDimentions,
        height: containerDimentions,
        padding: const EdgeInsets.all(containerPadding),
        child: value
            ? const Icon(
                Icons.check,
                size: iconSize,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
