import 'package:flutter/material.dart';

class CustomPopMenu extends StatelessWidget {
  final Map<String, Widget> dropdownItems;
  final double? radiousTopLeft;
  final double? radiousTopRight;
  final double? radiousBottomLeft;
  final double? radiousBottomRight;
  final double? menuheight;
  final Widget selectedValue;
  final double? menuWidth;
  final Function(Widget value) onChanged;
  const CustomPopMenu({
    super.key,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onChanged,
    this.radiousBottomLeft,
    this.radiousBottomRight,
    this.radiousTopLeft,
    this.radiousTopRight,
    this.menuheight,
    this.menuWidth,
  });

  @override
  Widget build(BuildContext context) {
    const Color defaultColor = Color(0xFFEAEAEA);
    const double height = 49;
    const double width = 204;
    const double borderRadious = 5;
    const double padding = 12;
    const double iconSize = 30;
    return PopupMenuButton<Widget>(
      onSelected: (value) {
        onChanged(value);
      },
      itemBuilder: (BuildContext context) {
        return dropdownItems.values
            .map((item) => PopupMenuItem<Widget>(
                  value: item,
                  child: item,
                ))
            .toList();
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            width: (menuWidth != null) ? menuWidth : width,
            height: (menuheight != null) ? menuheight : height,
            decoration: BoxDecoration(
              color: defaultColor,
              borderRadius: BorderRadius.only(
                topLeft: radiousTopLeft != null
                    ? Radius.circular(radiousTopLeft!)
                    : const Radius.circular(borderRadious),
                bottomLeft: radiousBottomLeft != null
                    ? Radius.circular(radiousBottomLeft!)
                    : const Radius.circular(borderRadious),
              ),
            ),
            child: Center(
              child: selectedValue,
            ),
          ),
          Container(
            height: (menuheight != null) ? height : height,
            decoration: BoxDecoration(
              color: defaultColor,
              borderRadius: BorderRadius.only(
                topRight: radiousTopRight != null
                    ? Radius.circular(radiousTopRight!)
                    : const Radius.circular(borderRadious),
                bottomRight: radiousBottomRight != null
                    ? Radius.circular(radiousBottomRight!)
                    : const Radius.circular(borderRadious),
              ),
            ),
            child: const Center(
              child: Icon(Icons.arrow_drop_down, size: iconSize),
            ),
          ),
        ],
      ),
    );
  }
}
