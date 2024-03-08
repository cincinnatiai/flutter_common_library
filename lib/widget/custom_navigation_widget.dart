import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';

class BreadcrumbNavigation extends StatelessWidget {
  final List<String> previousScreens;
  final String currentScreen;

  const BreadcrumbNavigation({
    super.key,
    required this.previousScreens,
    required this.currentScreen,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final ColorScheme theme = Theme.of(context).colorScheme;
    if (previousScreens.contains(currentScreen)) {
      while (previousScreens.last != currentScreen) {
        previousScreens.removeLast();
      }
    } else {
      previousScreens.add(currentScreen);
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: DimensCommon.sixteen),
      child: Container(
        constraints: BoxConstraints(maxWidth: screenWidth - 100),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(previousScreens.length, (index) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      for (var i = 1;
                          i < (previousScreens.length - index);
                          i++) {
                        if (index != previousScreens.length - 1) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.of(context).pop();
                            previousScreens.removeLast();
                          });
                        }
                      }
                    },
                    child: Text(
                      previousScreens[index],
                      style: TextStyle(
                        color: theme.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (index < previousScreens.length - 1)
                    const Icon(Icons.navigate_next),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
