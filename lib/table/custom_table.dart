import 'package:common/constants/dimens.dart';
import 'package:common/models/custom_data_cell_model.dart';
import 'package:common/models/custom_row_model.dart';
import 'package:common/widget/checkboxes/custom_checkbox.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

// ignore: must_be_immutable
class CustomTable extends StatefulWidget {
  final List<String> headers;
  final List<CustomRowModel> rows;
  int initialScrollPosition = 0;
  final Function(int index, DataCellAction action) event;
  final int scrollDelay = 500;
  final double rowHeight = 100.00;

  CustomTable(
      {super.key,
      required this.headers,
      required this.rows,
      required this.event,
      scrollPosition}) {
    if (scrollPosition != null) {
      initialScrollPosition = scrollPosition;
    }
  }

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  final List<DataColumn2> headers = [];
  final List<DataRow> rows = [];
  late ScrollController _scrollController;
  static String dataCellActionOnEdit = "data-cell-action-edit".i18n();
  static String dataCellActionOnCreate = "data-cell-action-create".i18n();
  static String dataCellActionOnDelete = "data-cell-action-delete".i18n();
  static String dataCellActionOnCopy = "data-cell-action-copy".i18n();
  static String dataCellActionOnClick = "data-cell-action-view".i18n();
  static double iconTextPopMenuSeparation = 8;
  static int tableTextMaxLines = 2;

  @override
  void initState() {
    super.initState();
    for (var header in widget.headers) {
      headers.add(DataColumn2(
        label: Text(header),
        size: header != "" ? ColumnSize.M : ColumnSize.S,
      ));
    }
    for (int index = 0; index < widget.rows.length; index++) {
      rows.add(getRows(index, widget.rows[index]));
    }
  }

  DataRow getRows(int index, CustomRowModel row) {
    final List<DataCell> temp = [];
    for (var dataCell in row.customDataCell) {
      switch (dataCell.type) {
        case DataCellWidget.popMenu:
          temp.add(
            DataCell(
              PopupMenuButton<DataCellAction>(
                icon: const Icon(Icons.more_horiz_outlined),
                itemBuilder: (context) {
                  return dataCell.actionsMenu!.map((action) {
                    return PopupMenuItem<DataCellAction>(
                      value: action,
                      child: Row(
                        children: [
                          Icon(getActionIcon(action)),
                          SizedBox(width: iconTextPopMenuSeparation),
                          Text(getActionText(action)),
                        ],
                      ),
                    );
                  }).toList();
                },
                onSelected: (action) {
                  widget.event(index, action);
                },
              ),
            ),
          );
          break;
        case DataCellWidget.text:
          temp.add(
            DataCell(
              Text(
                dataCell.text!,
                overflow: TextOverflow.ellipsis,
                maxLines: tableTextMaxLines,
              ),
            ),
          );
          break;
        case DataCellWidget.textButton:
          temp.add(DataCell(TextButton(
              child: Text(
                dataCell.text!,
                overflow: TextOverflow.ellipsis,
                maxLines: tableTextMaxLines,
              ),
              onPressed: () {
                widget.event(index, dataCell.actions!);
              })));
          break;
        case DataCellWidget.iconButton:
          temp.add(getIcon(index, dataCell));
          break;
        case DataCellWidget.checkbox:
          temp.add(
            DataCell(
              CustomCheckbox(
                parentValue: false,
                onChange: (value) {
                  widget.event(index, dataCell.actions!);
                },
              ),
            ),
          );
          break;
        case DataCellWidget.widget:
          temp.add(DataCell(dataCell.widget!));
          break;
      }
    }

    return DataRow(cells: temp);
  }

  IconData getActionIcon(DataCellAction action) {
    switch (action) {
      case DataCellAction.onEdit:
        return Icons.edit;
      case DataCellAction.onCopy:
        return Icons.copy;
      case DataCellAction.onDelete:
        return Icons.delete;
      case DataCellAction.onCreate:
        return Icons.add;
      case DataCellAction.onClick:
        return Icons.remove_red_eye;
      default:
        return Icons.edit;
    }
  }

  String getActionText(DataCellAction action) {
    switch (action) {
      case DataCellAction.onEdit:
        return dataCellActionOnEdit;
      case DataCellAction.onCopy:
        return dataCellActionOnCopy;
      case DataCellAction.onDelete:
        return dataCellActionOnDelete;
      case DataCellAction.onCreate:
        return dataCellActionOnCreate;
      case DataCellAction.onClick:
        return dataCellActionOnClick;
      default:
        return dataCellActionOnEdit;
    }
  }

  DataCell getIcon(int index, CustomDataCellModel data) {
    late final DataCell response;
    if (data.icons != null) {
      final List<Widget> children = [];
      for (var element in data.icons!) {
        children.add(
          IconButton(
            onPressed: () {
              widget.event(index, element.actions!);
            },
            icon: Icon(element.icon),
          ),
        );
      }
      response = DataCell(Row(children: children));
    } else {
      DataCell(
        IconButton(
            onPressed: () {
              widget.event(index, data.actions!);
            },
            icon: data.icon!),
      );
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController();
    var table = DataTable2(
      dataTextStyle:
          const TextStyle(leadingDistribution: TextLeadingDistribution.even),
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      dividerThickness: 0,
      columnSpacing: DimensCommon.two,
      dataRowHeight: widget.rowHeight,
      scrollController: _scrollController,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(DimensCommon.twelve),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: DimensCommon.four,
            blurRadius: DimensCommon.eight,
            offset: const Offset(DimensCommon.cero, DimensCommon.four),
          ),
        ],
      ),
      headingRowDecoration: const BoxDecoration(
          color: Color(0xFFFAFAFA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(DimensCommon.twelve),
            topRight: Radius.circular(DimensCommon.twelve),
          )),
      columns: headers,
      rows: rows,
    );
    if (widget.initialScrollPosition != 0) {
      Future.delayed(const Duration(milliseconds: 500), () {
        scrollToRow(widget.initialScrollPosition);
      });
    }
    return table;
  }

  // this method will allow you to scroll the original row
  void scrollToRow(int rowNumber) {
    final double scrollOffset = rowNumber * (widget.rowHeight);
    // Animate the scroll to the calculated offset
    _scrollController.animateTo(
      scrollOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
