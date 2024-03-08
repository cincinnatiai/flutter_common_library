import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class CustomMultipleDropdown extends StatelessWidget {
  final BuildContext? appContext;
  final String buttonText;
  final String title;
  final List<String> initialValue;
  final bool? centerText;
  final Function(List<String>) onConfirm;
  final List<MultiSelectItem<String>> items;
  const CustomMultipleDropdown(
      {required this.buttonText,
      this.appContext,
      required this.title,
      required this.items,
      this.centerText,
      required this.initialValue,
      required this.onConfirm,
      super.key});

  @override
  Widget build(BuildContext context) {
    final themeData =
        (appContext != null) ? Theme.of(appContext!) : Theme.of(context);
    double borderRadious = 5;
    double dialogWidth = 250;
    double paddingTitle = 12;
    return MultiSelectDialogField(
        decoration: BoxDecoration(
          border: Border.all(
              color: themeData.colorScheme.primaryContainer,
              width: DimensCommon.borderWidth),
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        buttonText: Text(buttonText,
            style: themeData.textTheme.bodyMedium,
            textAlign:
                (centerText == true) ? TextAlign.center : TextAlign.start),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingTitle),
          child: Text(
            title,
            style: themeData.textTheme.headlineSmall,
            textAlign:
                (centerText == true) ? TextAlign.center : TextAlign.start,
          ),
        ),
        items: items,
        dialogWidth: dialogWidth,
        initialValue: initialValue,
        backgroundColor: Colors.white,
        onConfirm: onConfirm,
        searchable: true,
        selectedColor: Colors.green,
        buttonIcon: const Icon(Icons.arrow_drop_down));
  }
}
