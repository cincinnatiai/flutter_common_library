import 'package:common/widget/pipeline_step/custom_lug.dart';
import 'package:common/widget/pipeline_step/custom_reorderable_list.dart';
import 'package:common/widget/textfield.dart';
import 'package:flutter/material.dart';

class MultipleChoiceGenerator extends StatelessWidget {
  const MultipleChoiceGenerator({
    super.key,
    required this.lugColor,
    required this.borderRadious,
    required this.controllers,
    required this.deleteOptionAtIndex,
    required this.itemCount,
    required this.onReorder,
  });

  final Color lugColor;
  final double borderRadious;
  final int itemCount;
  final List<TextEditingController> controllers;
  final Function(int optionIndex) deleteOptionAtIndex;
  final Function(int oldIndex, int newIndex) onReorder;

  @override
  Widget build(BuildContext context) {
    const double lugHeight = 31;
    const double deleteIconSize = 48;
    const double deleteIconRadious = 5;

    return CustomReorderableList(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Row(
          children: [
            CustomContainerLug(
                containerHeight: lugHeight,
                lugColor: lugColor,
                borderRadious: borderRadious),
            Flexible(
              child: SizedBox(
                child: CustomTextField(
                    radiousTopRight: 0,
                    radiousBottomRight: 0,
                    prefixIcon: const Icon(Icons.circle_outlined),
                    controller: controllers[index],
                    inputType: InputType.text,
                    labelText: ""),
              ),
            ),
            GestureDetector(
              onTap: () {
                deleteOptionAtIndex(index);
              },
              child: Container(
                height: deleteIconSize,
                width: deleteIconSize,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(deleteIconRadious),
                      bottomRight: Radius.circular(deleteIconRadious)),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
                child: const Icon(Icons.clear),
              ),
            )
          ],
        );
      },
      onReorder: (oldIndex, newIndex) {
        onReorder(oldIndex, newIndex);
      },
    );
  }
}
