import 'package:common/widget/sidebar/items_list.dart';
import 'package:common/widget/sidebar/sidebar_customization.dart';
import 'package:common/widget/sidebar/sidebar_widgets/sidebar_divider.dart';
import 'package:common/widget/sidebar/sidebar_widgets/sidebar_logo.dart';
import 'package:common/widget/sidebar/sidebar_widgets/sidebar_menu.dart';
import 'package:flutter/material.dart';

class MySidebar extends StatefulWidget {
  final String imagePath;

  const MySidebar({
    super.key,
    required this.imagePath,
  });

  @override
  State<MySidebar> createState() => _MySidebarState();
}

class _MySidebarState extends State<MySidebar> {
  static const double reducedWidth = 70;
  static const double reducedHeight = 70;
  static const double sidebarPaddingSides = 10;
  static const double sidebarPaddingTopBottom = 30;
  static const double sideBarBorderRadious = 16;
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const double expandedWidth = 220;
  static const double sidebarBreakpoint = 900;
  double width = reducedWidth;
  double height = reducedHeight;
  bool onSideBar = false;
  static List<BoxShadow> sidebarShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 5,
      offset: const Offset(0, 2),
    ),
  ];
  double itemsSpace = items.length * 60;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < sidebarBreakpoint) {
      setReducedWidth();
    } else {
      setExpandedWidth();
    }

    return Padding(
      padding: const EdgeInsets.all(sidebarPaddingSides),
      child: MouseRegion(
        onEnter: (event) {
          if (screenWidth < sidebarBreakpoint && onSideBar == true) {
            setExpandedWidth();
          }
        },
        onExit: (event) {
          if (screenWidth < sidebarBreakpoint) {
            setReducedWidth();
          }
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(
              vertical: sidebarPaddingTopBottom,
              horizontal: sidebarPaddingSides),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
            ),
            borderRadius: BorderRadius.circular(sideBarBorderRadious),
            boxShadow: sidebarShadow,
          ),
          duration: animationDuration,
          width: width,
          child: Column(
            children: [
              SideBarLogo(
                width: width,
                animationDuration: animationDuration,
                imagePath: widget.imagePath,
              ),
              const SidebarDivider(),
              const SidebarMenu(),
            ],
          ),
        ),
      ),
    );
  }

  void setExpandedWidth() {
    setState(() {
      onSideBar = true;
      width = expandedWidth;
    });
  }

  void setReducedWidth() {
    setState(() {
      onSideBar = false;
      width = reducedWidth;
    });
  }
}
