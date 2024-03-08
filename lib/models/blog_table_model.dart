import 'package:common/models/custom_row_model.dart';

class CustomTableModel {
  final List<String> headers;
  final List<CustomRowModel> rows;

  CustomTableModel({
    required this.headers,
    required this.rows,
  });
}
