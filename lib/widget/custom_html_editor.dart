import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CustomHtmlEditor extends StatefulWidget {
  final QuillEditorController editorController;
  final String initialValue;
  final bool isEnable;
  final double? height;
  final double minHeight;
  final Function() onTextChanged;
  const CustomHtmlEditor({
    super.key,
    required this.editorController,
    required this.onTextChanged,
    this.height,
    this.initialValue = "",
    this.isEnable = true,
    this.minHeight = DimensCommon.fourHundred,
  });

  @override
  State<CustomHtmlEditor> createState() => _CustomHtmlEditorState();
}

class _CustomHtmlEditorState extends State<CustomHtmlEditor> {
  final Color borderColor = const Color.fromRGBO(247, 249, 252, 1);
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(maxHeight: DimensCommon.oneThousand),
      height: widget.height,
      decoration: BoxDecoration(
          border: Border.all(
            color: themeData.colorScheme.primaryContainer,
            width: DimensCommon.borderWidth,
          ),
          borderRadius: BorderRadius.circular(DimensCommon.four)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ToolBar(
            toolBarColor: borderColor,
            padding: const EdgeInsets.all(DimensCommon.eight),
            iconSize: DimensCommon.sixteen,
            activeIconColor: themeData.colorScheme.primary,
            controller: widget.editorController,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
          ),
          Flexible(
            child: QuillHtmlEditor(
              text: widget.initialValue,
              hintText: 'Content',
              hintTextStyle: TextStyle(color: borderColor),
              controller: widget.editorController,
              isEnabled: widget.isEnable,
              minHeight: widget.minHeight,
              hintTextAlign: TextAlign.start,
              padding: const EdgeInsets.only(
                left: DimensCommon.eight,
                right: DimensCommon.eight,
                top: DimensCommon.four,
              ),
              hintTextPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              loadingBuilder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 0.4,
                  ),
                );
              },
              onTextChanged: (p0) {
                widget.onTextChanged();
              },
            ),
          ),
        ],
      ),
    );
  }
}
