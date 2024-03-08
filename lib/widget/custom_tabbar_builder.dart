import 'package:flutter/material.dart';

class CustomTabViewBuilder extends StatelessWidget {
  final List<Widget> tabBarTitles;
  final List<Widget> tabViewWidgets;
  final double tabViewHeight;
  final double tabViewWidth;
  const CustomTabViewBuilder({
    super.key,
    required this.tabViewHeight,
    required this.tabViewWidth,
    required this.tabBarTitles,
    required this.tabViewWidgets,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double labelPadding = 12;
    return DefaultTabController(
      length: tabBarTitles.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: TabBar(
              labelPadding: const EdgeInsets.all(labelPadding),
              labelStyle: theme.textTheme.labelSmall,
              indicatorColor: theme.colorScheme.primary,
              labelColor: theme.colorScheme.primary,
              unselectedLabelColor: theme.colorScheme.secondary,
              tabs: tabBarTitles,
            ),
          ),
          SizedBox(
            width: tabViewWidth,
            height: tabViewHeight,
            child: IndexedStack(
              children: tabViewWidgets,
            ),
          ),
        ],
      ),
    );
  }
}
