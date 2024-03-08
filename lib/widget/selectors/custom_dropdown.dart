import 'package:common/constants/dimens.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    super.key,
  });
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    double fontsSize = 17;
    double altIconSize = 18;
    int altDropdownElevation = 8;
    final theme = Theme.of(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: buttonWidth != null ? false : true,
        hint: Text(
          hint,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: fontsSize,
            color: Theme.of(context).hintColor,
          ),
        ),
        value: value,
        items: dropdownItems
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    alignment: valueAlignment,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: fontsSize,
                      ),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          padding: buttonPadding ??
              const EdgeInsets.symmetric(horizontal: DimensCommon.twenty),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(DimensCommon.four),
                border: Border.all(
                  color: theme.colorScheme.primary,
                ),
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon ?? const Icon(Icons.arrow_drop_down_outlined),
          iconSize: iconSize ?? altIconSize,
          iconEnabledColor: theme.colorScheme.primary,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: dropdownHeight ?? DimensCommon.twoHundred,
          width: dropdownWidth ?? DimensCommon.threeHundred,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(DimensCommon.twelve),
              ),
          elevation: dropdownElevation ?? altDropdownElevation,
          offset: offset,
          scrollbarTheme: ScrollbarThemeData(
            radius:
                scrollbarRadius ?? const Radius.circular(DimensCommon.fourty),
            thickness: scrollbarThickness != null
                ? MaterialStateProperty.all<double>(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? DimensCommon.fourty,
          padding: itemPadding ??
              const EdgeInsets.symmetric(horizontal: DimensCommon.twelve),
        ),
      ),
    );
  }
}
