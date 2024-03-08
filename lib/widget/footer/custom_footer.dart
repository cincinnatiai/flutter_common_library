import 'package:flutter/material.dart';

class CustomizableFooter extends StatelessWidget {
  final List<Widget> widgets;
  final double height;
  final Widget? companyNameRow;
  final Color? backgroundColor;

  const CustomizableFooter({
    super.key,
    required this.widgets,
    this.height = 150.0,
    this.companyNameRow,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    int columnCount = widgets.length;
    double columnWidth = MediaQuery.of(context).size.width / columnCount;

    return Container(
      height: height,
      color: backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: widgets
                  .map((widget) => Expanded(
                        child: SizedBox(
                          width: columnWidth,
                          child: widget,
                        ),
                      ))
                  .toList(),
            ),
          ),
          if (companyNameRow != null)
            Column(
              children: [
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                companyNameRow!,
              ],
            ),
        ],
      ),
    );
  }
}
