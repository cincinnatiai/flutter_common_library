import 'package:common/constants/dimens.dart';
import 'package:common/constants/multiselector_constants.dart';
import 'package:common/widget/custom_dropdown.dart';
import 'package:common/widget/pipeline_step/custom_action_side_icons.dart';
import 'package:common/widget/checkboxes/custom_checkbox.dart';
import 'package:common/widget/custom_html_editor.dart';
import 'package:common/widget/pipeline_step/custom_lug.dart';
import 'package:common/widget/pop_ups/custom_popupmenu.dart';
import 'package:common/widget/pipeline_step/multiple_choice_generator.dart';
import 'package:common/widget/pipeline_step/row_or_column.dart';
import 'package:common/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CustomMultiselector extends StatefulWidget {
  final TextEditingController titleEditingController;
  final TextEditingController descriptionController;
  final TextEditingController generalController;
  final List<TextEditingController>? optionsEditingController;
  final Map<String, Widget> popMenuItems;
  final VoidCallback addOptions;
  final VoidCallback deleteTileAtIndex;
  final VoidCallback copyTile;
  final Function(int optionIndex) deleteOptionAtIndex;
  final Function(String item) menuItem;
  final String instructionText;
  final double? screenSize;
  final String currentValue;
  final String? htmlInitialValue;
  final Function(String text) htmlText;
  final QuillEditorController? htmlController;
  final String stepLabelTitle;
  final String stepLabelDescription;
  final String checkBoxTitle;
  final bool initialCheckBoxValue;
  final Function(bool optionIndex) stageOptionAtIndex;
  final List<String> typeValues;
  final List<String> previousSteps;
  final String currentTypeValue;
  final String? currentStepValue;
  final Function(String value) onChangeTypeValue;
  final Function(String value) onChangePreviousStep;
  final double maxwidth;

  const CustomMultiselector({
    super.key,
    required this.titleEditingController,
    required this.descriptionController,
    required this.generalController,
    required this.popMenuItems,
    this.optionsEditingController,
    this.htmlController,
    this.htmlInitialValue,
    required this.addOptions,
    required this.deleteTileAtIndex,
    required this.deleteOptionAtIndex,
    required this.copyTile,
    required this.instructionText,
    required this.screenSize,
    required this.menuItem,
    required this.currentValue,
    required this.htmlText,
    required this.stepLabelTitle,
    required this.stepLabelDescription,
    required this.checkBoxTitle,
    required this.initialCheckBoxValue,
    required this.stageOptionAtIndex,
    required this.typeValues,
    required this.previousSteps,
    required this.currentTypeValue,
    required this.currentStepValue,
    required this.onChangeTypeValue,
    required this.onChangePreviousStep,
    required this.maxwidth,
  });

  @override
  State<CustomMultiselector> createState() => _CustomMultiselectorState();
}

class _CustomMultiselectorState extends State<CustomMultiselector> {
  late Widget currentValue;
  late String currentTypeValue = widget.currentTypeValue;
  final String? currentStepValue = null;

  String getKeyForSelectedValue(
      Map<String, Widget> popMenuOptions, Widget selectedValue) {
    for (var entry in popMenuOptions.entries) {
      if (entry.value == selectedValue) {
        return entry.key;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    currentValue = widget.popMenuItems[widget.currentValue]!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Constants.containerMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [Constants.boxShadow],
        borderRadius: BorderRadius.circular(Constants.borderRadius),
      ),
      child: Row(
        children: [
          const CustomContainerLug(
            lugColor: Constants.lugColor,
            borderRadious: Constants.borderRadius,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(
                  color: Constants.borderColor,
                  width: Constants.borderWidth,
                ),
                left: BorderSide(
                  color: Constants.borderColor,
                  width: Constants.borderWidth,
                ),
              ),
            ),
            padding: const EdgeInsets.all(Constants.contentContainerPadding),
            width: widget.screenSize! - Constants.containerWidth,
            constraints: BoxConstraints(
              maxWidth: widget.maxwidth - Constants.screenBreakPoint,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildTitleAndMenu(),
                buildDescriptionInput(),
                widgetSelectedManager(context, widget.currentValue),
                buildCheckbox(
                    onChanged: (value) {
                      widget.onChangeTypeValue(value);
                      setState(() {
                        currentTypeValue = value;
                      });
                    },
                    currentValue: currentTypeValue),
              ],
            ),
          ),
          ActionIconsSideBar(
            borderColor: Constants.borderColor,
            iconColor: Constants.iconColor,
            deleteAction: widget.deleteTileAtIndex,
            copyAction: widget.copyTile,
            imageAction: () {},
          )
        ],
      ),
    );
  }

  Widget widgetSelectedManager(BuildContext context, String widgetType) {
    switch (widgetType) {
      // TODO: Implement a way to change this hardcode values
      case "url_launcher":
        return buildTextField(context, "step-url-widget".i18n());
      case "html":
        return buildHtmlEditorSection(context);
      case "agi_request":
        return buildTextField(context, "step-requests-widget".i18n());
      case "agi_request_agglomerate":
        return buildAgiAgglomerate();
      default:
        return buildMultipleChoiceSection(context);
    }
  }

  Widget buildTitleAndMenu() {
    return RowOrColumn(
      breakpoint: Constants.screenBreakPoint,
      widget1: Flexible(
        child: CustomTextField(
          radiousTopRight: 0,
          radiousBottomRight: 0,
          controller: widget.titleEditingController,
          inputType: InputType.text,
          labelText: widget.stepLabelTitle,
        ),
      ),
      widget2: CustomPopMenu(
        menuWidth: Constants.menuWidth,
        radiousTopLeft: 0,
        radiousBottomLeft: 0,
        dropdownItems: widget.popMenuItems,
        selectedValue: currentValue,
        onChanged: (value) {
          setState(() {
            currentValue = value;
            String item =
                getKeyForSelectedValue(widget.popMenuItems, currentValue);
            widget.menuItem(item);
          });
        },
      ),
      rowMainAxis: MainAxisAlignment.start,
      rowCrossAxis: CrossAxisAlignment.start,
      columnMainAxis: MainAxisAlignment.center,
      columnCrossAxis: CrossAxisAlignment.start,
    );
  }

  Widget buildDescriptionInput() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Constants.padding),
      constraints: BoxConstraints(
        maxWidth: widget.screenSize! - Constants.containerWidth,
      ),
      child: CustomTextField(
        radiousTopRight: 0,
        radiousBottomRight: 0,
        controller: widget.descriptionController,
        inputType: InputType.text,
        labelText: widget.stepLabelDescription,
      ),
    );
  }

  Widget buildAgiAgglomerate() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          controller: widget.generalController,
          inputType: InputType.text,
          labelText: "step-requests-widget".i18n(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: Constants.padding),
          child: CustomDropdown(
              hint: "step-requests-agglomerate".i18n(),
              value: widget.currentStepValue,
              dropdownItems: widget.previousSteps,
              onChanged: (value) {
                if (value != null) {
                  widget.onChangePreviousStep(value);
                }
              }),
        )
      ],
    );
  }

  Widget buildMultipleChoiceSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MultipleChoiceGenerator(
          lugColor: Constants.lugColor,
          borderRadious: Constants.borderRadius,
          itemCount: widget.optionsEditingController!.length,
          controllers: widget.optionsEditingController!,
          deleteOptionAtIndex: (optionIndex) {
            widget.deleteOptionAtIndex(optionIndex);
          },
          onReorder: (oldIndex, newIndex) {
            setState(() {
              newIndex = (oldIndex < newIndex) ? newIndex - 1 : newIndex;
              final item = widget.optionsEditingController!.removeAt(oldIndex);
              widget.optionsEditingController!.insert(newIndex, item);
            });
          },
        ),
        Row(
          children: [
            Text(widget.instructionText),
            IconButton(
              onPressed: widget.addOptions,
              icon: Icon(
                Icons.add_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTextField(BuildContext context, String labelText) {
    return CustomTextField(
      controller: widget.generalController,
      inputType: InputType.text,
      labelText: labelText,
    );
  }

  Widget buildHtmlEditorSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.padding),
      child: CustomHtmlEditor(
        initialValue: widget.htmlInitialValue!,
        editorController: widget.htmlController!,
        onTextChanged: () async {
          String text = await widget.htmlController!.getText();
          widget.htmlText(text);
        },
      ),
    );
  }

  Widget buildCheckbox(
      {required Function(String value) onChanged,
      required String currentValue}) {
    const double decisionDropdownWidth = 250;
    const double decisionDropdownHeight = 50;
    const double multiselectorLastRowBreakPoint = 500;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: DimensCommon.eight),
        child: RowOrColumn(
            breakpoint: multiselectorLastRowBreakPoint,
            widget1: Row(
              children: [
                CustomCheckbox(
                  onChange: (bool value) {
                    setState(() {
                      widget.stageOptionAtIndex(value);
                    });
                  },
                  parentValue: widget.initialCheckBoxValue,
                ),
                Text(widget.checkBoxTitle),
              ],
            ),
            widget2: SizedBox(
              width: decisionDropdownWidth,
              height: decisionDropdownHeight,
              child: CustomDropdown(
                  hint: "",
                  value: currentValue,
                  dropdownItems: widget.typeValues,
                  onChanged: (value) {
                    onChanged(value!);
                  }),
            ),
            rowMainAxis: MainAxisAlignment.spaceBetween,
            columnMainAxis: MainAxisAlignment.spaceBetween,
            columnCrossAxis: CrossAxisAlignment.center,
            rowCrossAxis: CrossAxisAlignment.center));
  }
}
