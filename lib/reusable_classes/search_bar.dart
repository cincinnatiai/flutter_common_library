import 'package:common/constants/dimens.dart';
import 'package:common/widget/buttons/custom_button.dart';
import 'package:common/widget/textfield.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController textController;
  final String buttonText;
  final bool showButton;
  final Function() onButtonClicked;
  final String inputText;

  const CustomSearchBar({
    super.key,
    required this.textController,
    required this.buttonText,
    required this.onButtonClicked,
    required this.inputText,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double breakPoint = 1400;
    return Padding(
      padding: const EdgeInsets.only(bottom: DimensCommon.twelve),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: screenWidth < breakPoint
                ? DimensCommon.oneHundred
                : DimensCommon.twoHundred,
            child: CustomTextField(
              controller: textController,
              inputType: InputType.text,
              labelText: inputText,
            ),
          ),
          if (showButton)
            Padding(
              padding: const EdgeInsets.only(left: DimensCommon.twelve),
              child: CustomButton(
                width: DimensCommon.oneHundredTwenty,
                onPressed: () {
                  onButtonClicked();
                },
                buttonText: buttonText,
              ),
            ),
        ],
      ),
    );
  }
}
