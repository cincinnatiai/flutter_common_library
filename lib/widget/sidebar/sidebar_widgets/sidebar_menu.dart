import 'package:common/widget/sidebar/items_list.dart';
import 'package:common/widget/sidebar/sidebar_widgets/sidebar_button.dart';
import 'package:common/widget/sidebar/sidebar_widgets/sidebar_divider.dart';
import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return SidebarButton(
                leadingIcon: items[index].icon,
                label: items[index].label,
                onPressed: () {
                  Navigator.of(context).pushNamed(items[index].route);
                });
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SidebarDivider();
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
