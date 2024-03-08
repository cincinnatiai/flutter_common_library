import 'package:common/constants/dimens.dart';
import 'package:common/widget/custom_confirmation_dialog/default_body.dart';
import 'package:common/widget/custom_confirmation_dialog/widgets/header.dart';
import 'package:flutter/material.dart';

class CustomConfirmationDialog {
  static void pop({
    final List<String>? missingFields,
    required BuildContext context,
    required String title,
    String? message,
    final String? secondaryMessage,
    String? buttonYes,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? buttonNo,
    Widget? child,
    IconData? indentifyingIcon = Icons.warning_amber_rounded,
    Color? iconColor = Colors.amber,
  }) {
    const double iconSize = DimensCommon.fourty;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        showDialog(
          context: context,
          useSafeArea: true,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              elevation: DimensCommon.eight,
              scrollable: true,
              title: Header(
                iconSize: iconSize,
                iconColor: iconColor!,
                indentifyingIcon: indentifyingIcon!,
                title: title,
              ),
              content: child ??
                  DefaultContent(
                    message: message!,
                    secondaryMessage: secondaryMessage,
                    missingFields: missingFields,
                  ),
              actions: <Widget>[
                if (buttonNo != null)
                  TextButton(
                    child: Text(buttonNo),
                    onPressed: () {
                      if (onCancel != null) onCancel();
                      Navigator.of(context).pop();
                    },
                  ),
                if (buttonYes != null)
                  TextButton(
                    child: Text(buttonYes),
                    onPressed: () {
                      if (onConfirm != null) onConfirm();
                      Navigator.of(context).pop();
                    },
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
