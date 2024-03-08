import 'package:flutter/material.dart';

class RowOrColumn extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final MainAxisAlignment rowMainAxis;
  final MainAxisAlignment columnMainAxis;
  final CrossAxisAlignment columnCrossAxis;
  final CrossAxisAlignment rowCrossAxis;
  final double breakpoint;

  const RowOrColumn({
    super.key,
    required this.widget1,
    required this.widget2,
    required this.rowMainAxis,
    required this.columnMainAxis,
    required this.columnCrossAxis,
    required this.rowCrossAxis,
    this.breakpoint = 1000,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < breakpoint) {
          return Center(
            child: Column(
              mainAxisAlignment: columnMainAxis,
              crossAxisAlignment: columnCrossAxis,
              children: [widget1, widget2],
            ),
          );
        } else {
          return Row(
            mainAxisAlignment: rowMainAxis,
            crossAxisAlignment: rowCrossAxis,
            children: [widget1, widget2],
          );
        }
      },
    );
  }
}
