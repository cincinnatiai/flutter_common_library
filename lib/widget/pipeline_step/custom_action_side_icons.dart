import 'package:common/widget/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ActionIconsSideBar extends StatelessWidget {
  const ActionIconsSideBar({
    super.key,
    required this.borderColor,
    required this.iconColor,
    required this.deleteAction,
    required this.copyAction,
    required this.imageAction,
  });

  final Color borderColor;
  final Color iconColor;
  final VoidCallback deleteAction;
  final VoidCallback copyAction;
  final VoidCallback imageAction;

  @override
  Widget build(BuildContext context) {
    const double width = 100;
    const double height = 260;
    const double borderWidth = 1;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIconButton(
            buttonIcon: Icon(
              Icons.delete,
              color: iconColor,
            ),
            onTap: deleteAction,
          ),
          CustomIconButton(
              buttonIcon: Icon(
                Icons.copy_outlined,
                color: iconColor,
              ),
              onTap: copyAction),
          CustomIconButton(
              buttonIcon: Icon(
                Icons.image_outlined,
                color: iconColor,
              ),
              onTap: imageAction)
        ],
      ),
    );
  }
}
