import 'package:common/models/custom_data_cell_model.dart';
import 'package:flutter/material.dart';

class IconOptionsModel {
  final IconData icon;
  final DataCellAction? actions;

  IconOptionsModel({
    required this.icon,
    required this.actions,
  });
}
