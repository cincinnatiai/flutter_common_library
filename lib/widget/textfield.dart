import 'package:common/constants/constants.dart';
import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType { text, number, email, dropdown, checkboxGroup }

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputType inputType;
  String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String labelText;
  final ValueChanged<String>? onChanged;
  String? errorText;
  final bool? enableCapitalization;
  final bool? obscureText;
  final FocusNode? focusNode;
  final String? counterText;
  final bool? centerText;
  final double? contentPadding;
  final double? radiousTopLeft;
  final double? radiousTopRight;
  final double? radiousBottomLeft;
  final double? radiousBottomRight;

  CustomTextField({
    super.key,
    this.contentPadding = 30,
    this.centerText = false,
    required this.controller,
    this.focusNode,
    required this.inputType,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.labelText,
    this.counterText,
    this.onChanged,
    this.errorText,
    this.obscureText = false,
    this.enableCapitalization = false,
    this.radiousBottomLeft,
    this.radiousBottomRight,
    this.radiousTopLeft,
    this.radiousTopRight,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadious = 5;
    final themeData = Theme.of(context);
    return TextFormField(
      textAlign: (centerText == true) ? TextAlign.center : TextAlign.start,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      textCapitalization: enableCapitalization!
          ? TextCapitalization.words
          : TextCapitalization.none,
      textInputAction: TextInputAction.next,
      obscureText: obscureText!,
      style: themeData.textTheme.bodyMedium,
      keyboardType: _getKeyboardType(inputType),
      inputFormatters: _getInputFormatter(inputType),
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: themeData.colorScheme.primary),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: radiousTopLeft != null
                  ? Radius.circular(radiousTopLeft!)
                  : Radius.circular(borderRadious),
              topRight: radiousTopRight != null
                  ? Radius.circular(radiousTopRight!)
                  : Radius.circular(borderRadious),
              bottomLeft: radiousBottomLeft != null
                  ? Radius.circular(radiousBottomLeft!)
                  : Radius.circular(borderRadious),
              bottomRight: radiousBottomRight != null
                  ? Radius.circular(radiousBottomRight!)
                  : Radius.circular(borderRadious),
            ),
            borderSide: BorderSide(
                color: themeData.colorScheme.primaryContainer,
                width: DimensCommon.borderWidth)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: radiousTopLeft != null
                  ? Radius.circular(radiousTopLeft!)
                  : Radius.circular(borderRadious),
              topRight: radiousTopRight != null
                  ? Radius.circular(radiousTopRight!)
                  : Radius.circular(borderRadious),
              bottomLeft: radiousBottomLeft != null
                  ? Radius.circular(radiousBottomLeft!)
                  : Radius.circular(borderRadious),
              bottomRight: radiousBottomRight != null
                  ? Radius.circular(radiousBottomRight!)
                  : Radius.circular(borderRadious),
            ),
            borderSide: BorderSide(
                color: themeData.colorScheme.primary,
                width: DimensCommon.borderWidth)),
        contentPadding: EdgeInsets.symmetric(horizontal: contentPadding!),
        hintText: hintText,
        prefixIcon: prefixIcon,
        labelText: labelText,
        errorText: errorText,
        counterText: counterText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: radiousTopLeft != null
                  ? Radius.circular(radiousTopLeft!)
                  : Radius.circular(borderRadious),
              topRight: radiousTopRight != null
                  ? Radius.circular(radiousTopRight!)
                  : Radius.circular(borderRadious),
              bottomLeft: radiousBottomLeft != null
                  ? Radius.circular(radiousBottomLeft!)
                  : Radius.circular(borderRadious),
              bottomRight: radiousBottomRight != null
                  ? Radius.circular(radiousBottomRight!)
                  : Radius.circular(borderRadious),
            ),
            borderSide: BorderSide(
                color: themeData.colorScheme.primaryContainer,
                width: DimensCommon.borderWidth)),
        suffixIcon: (suffixIcon != null) ? suffixIcon : null,
      ),
    );
  }

  TextInputType _getKeyboardType(InputType type) {
    switch (type) {
      case InputType.text:
        return TextInputType.text;
      case InputType.checkboxGroup:
        return TextInputType.text;
      case InputType.number:
        return TextInputType.number;
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.dropdown:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? _getInputFormatter(InputType type) {
    switch (type) {
      case InputType.text:
        return null;
      case InputType.checkboxGroup:
        return null;
      case InputType.number:
        return [FilteringTextInputFormatter.allow(numberRegExp)];
      case InputType.email:
        return [FilteringTextInputFormatter.allow(emailRegExp)];
      case InputType.dropdown:
        return null;
    }
  }
}
