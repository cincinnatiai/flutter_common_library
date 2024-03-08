import 'package:flutter/material.dart';

class CustomReorderableList extends StatelessWidget {
  final Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final Function(int oldIndex, int newIndex) onReorder;
  const CustomReorderableList({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = itemBuilder(context, index);
        return ListTile(
            key: Key('$item $index'),
            title: ReorderableDragStartListener(
              index: index,
              child: item,
            ));
      },
      itemCount: itemCount,
      onReorder: (oldIndex, newIndex) {
        onReorder(oldIndex, newIndex);
      },
    );
  }
}
