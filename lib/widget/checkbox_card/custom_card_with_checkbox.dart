import 'package:common/widget/checkbox_card/widgets/round_checkbox.dart';
import 'package:flutter/material.dart';

class CheckBoxCard extends StatefulWidget {
  final String text;
  final bool boolValue;
  final Function(bool isItFill) callBackFunction;
  const CheckBoxCard({
    super.key,
    required this.text,
    required this.boolValue,
    required this.callBackFunction,
  });

  @override
  State<CheckBoxCard> createState() => _CheckBoxCardState();
}

class _CheckBoxCardState extends State<CheckBoxCard> {
  static const double borderRadious = 50;
  static const double sizedBoxSpace = 16;
  static const double padding = 10;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(borderRadious),
      onTap: () {
        widget.callBackFunction(!widget.boolValue);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadious),
          border: widget.boolValue
              ? Border.all(color: themeData.colorScheme.primary)
              : Border.all(color: themeData.colorScheme.tertiary),
          shape: BoxShape.rectangle,
        ),
        height: borderRadious,
        width: double.infinity,
        child: Row(
          children: [
            const SizedBox(width: sizedBoxSpace),
            Padding(
              padding: const EdgeInsets.all(padding),
              child: RoundCheckbox(
                value: widget.boolValue,
                onChanged: (value) {
                  widget.callBackFunction(value);
                },
              ),
            ),
            Flexible(
              child: Text(
                widget.text,
                style: themeData.textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
