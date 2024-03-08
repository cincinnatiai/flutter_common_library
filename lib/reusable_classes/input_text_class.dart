import 'package:common/widget/textfield.dart';
import 'package:flutter/material.dart';

class ReusableTextInput extends StatefulWidget {
  final int numInputs;
  final String buttonText;
  final int rows;
  final List<String> inputTitles;
  final Function(List<String>) onButtonPressed;

  const ReusableTextInput({
    super.key,
    required this.numInputs,
    required this.buttonText,
    required this.rows,
    required this.onButtonPressed,
    required this.inputTitles,
  });

  @override
  State<ReusableTextInput> createState() => _ReusableTextInputState();
}

class _ReusableTextInputState extends State<ReusableTextInput> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numInputs; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    int inputsPerRow = widget.numInputs ~/ widget.rows;
    const paddingRows = 8.0;
    return Column(
      children: [
        for (int row = 0; row < widget.rows; row++)
          Row(
            children: [
              for (int i = row * inputsPerRow;
                  i < (row + 1) * inputsPerRow;
                  i++)
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingRows),
                    child: CustomTextField(
                      controller: _controllers[i],
                      inputType: InputType.text,
                      labelText: widget.inputTitles[i],
                    ),
                  ),
                ),
            ],
          ),
        ElevatedButton(
          onPressed: () {
            List<String> texts =
                _controllers.map((controller) => controller.text).toList();
            widget.onButtonPressed(texts);
          },
          child: Text(widget.buttonText),
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
