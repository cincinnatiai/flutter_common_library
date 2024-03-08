import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  final double width;
  const CustomContainer(
      {super.key, required this.child, this.width = double.infinity});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(DimensCommon.twenty),
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
      child: widget.child,
    );
  }
}
