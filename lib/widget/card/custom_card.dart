import 'package:flutter/material.dart';

enum CardLayout { leftImage, rightImage, imageAbove }

enum CardSize { small, medium, large }

class CustomCard extends StatelessWidget {
  final String? preTitle;
  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? image;
  final CardLayout layout;
  final CardSize size;

  const CustomCard({
    super.key,
    this.preTitle,
    this.title,
    this.subtitle,
    this.description,
    this.image,
    required this.layout,
    this.size = CardSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize;
    switch (size) {
      case CardSize.small:
        fontSize = 16.0;
        break;
      case CardSize.medium:
        fontSize = 24.0;
        break;
      case CardSize.large:
        fontSize = 64.0;
        break;
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              child: layout == CardLayout.imageAbove
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        if (image != null) image!,
                        const SizedBox(height: 16.0),
                        if (preTitle != null)
                          Text(preTitle!,
                              style: TextStyle(fontSize: fontSize / 4)),
                        if (title != null)
                          Text(title!, style: TextStyle(fontSize: fontSize)),
                        if (subtitle != null)
                          Text(subtitle!,
                              style: TextStyle(fontSize: fontSize / 4)),
                        if (description != null)
                          Text(description!,
                              style: TextStyle(fontSize: fontSize / 2)),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (layout == CardLayout.leftImage && image != null)
                          image!,
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: layout == CardLayout.leftImage ? 16.0 : 0.0,
                              right:
                                  layout == CardLayout.rightImage ? 16.0 : 0.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                if (preTitle != null)
                                  Text(preTitle!,
                                      style: TextStyle(fontSize: fontSize / 4)),
                                if (title != null)
                                  Text(title!,
                                      style: TextStyle(fontSize: fontSize)),
                                if (subtitle != null)
                                  Text(subtitle!,
                                      style: TextStyle(fontSize: fontSize / 4)),
                                if (description != null)
                                  Text(description!,
                                      style: TextStyle(fontSize: fontSize / 2)),
                              ],
                            ),
                          ),
                        ),
                        if (layout == CardLayout.rightImage && image != null)
                          image!,
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
