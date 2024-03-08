import 'package:common/models/icon_options_model.dart';
import 'package:flutter/material.dart';

class CustomDataCellModel {
  final DataCellWidget type;
  final String? text;
  final Icon? icon;
  final List<IconOptionsModel>? icons;
  final Widget? widget;
  final DataCellAction? actions;
  final List<DataCellAction>? actionsMenu;

  CustomDataCellModel({
    required this.type,
    this.text,
    this.icon,
    this.icons,
    this.widget,
    this.actions,
    this.actionsMenu,
  });
}

enum DataCellWidget {
  text,
  textButton,
  iconButton,
  checkbox,
  popMenu,
  widget,
}

enum DataCellAction {
  onClick,
  onPressCheckbox,
  onCreate,
  onEdit,
  onDelete,
  onCopy,
  onLoadMore
}
