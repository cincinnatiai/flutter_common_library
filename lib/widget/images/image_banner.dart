import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum SVGImageSize { small, medium, large }

class ImageBanner extends StatelessWidget {
  final String path;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final SVGImageSize? sVGImageSize;
  final BoxFit? fit;
  final Function()? onPressed;

  const ImageBanner({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    required this.path,
    this.sVGImageSize,
    this.onPressed,
    this.fit,
  });

  double getImageSize(SVGImageSize? size) {
    switch (size) {
      case SVGImageSize.small:
        return 75.0;
      case SVGImageSize.medium:
        return 100.0;
      case SVGImageSize.large:
        return 150.0;
      default:
        return 100.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double? finalWidth = width;
    double? finalHeight = height;
    bool isSVG = false;

    if (path.contains(".svg")) {
      isSVG = true;
    }

    if (sVGImageSize != null) {
      final imageSize = getImageSize(sVGImageSize);
      finalWidth = imageSize;
      finalHeight = imageSize;
    }
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: isSVG
          ? Container(
              width: finalWidth,
              height: finalHeight,
              color: backgroundColor,
              child: Center(
                child: SvgPicture.asset(
                  path,
                  fit: fit ?? BoxFit.contain,
                ),
              ),
            )
          : Image.asset(
              path,
              width: finalWidth,
              height: finalHeight,
              color: backgroundColor,
              fit: fit,
            ),
    );
  }
}
