import 'package:common/models/custom_data_cell_model.dart';

class CustomRowModel {
  final String? itemId;
  final List<CustomDataCellModel> customDataCell;

  CustomRowModel({
    this.itemId,
    required this.customDataCell,
  });
}
