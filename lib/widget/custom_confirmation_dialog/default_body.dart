import 'package:common/constants/dimens.dart';
import 'package:flutter/material.dart';

class DefaultContent extends StatelessWidget {
  const DefaultContent({
    super.key,
    required this.message,
    this.secondaryMessage,
    required this.missingFields,
  });

  final String message;
  final String? secondaryMessage;
  final List<String>? missingFields;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: DimensCommon.twenty,
          ),
        ),
        if (secondaryMessage != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DimensCommon.twelve),
            child: Text(
              secondaryMessage!,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: DimensCommon.twenty,
              ),
            ),
          ),
        if (missingFields != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: DimensCommon.twelve),
            child: Text(
              missingFields!.join('\n'),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: DimensCommon.twenty,
              ),
            ),
          )
      ],
    );
  }
}
