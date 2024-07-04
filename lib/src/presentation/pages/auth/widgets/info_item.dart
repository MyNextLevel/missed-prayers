import 'package:flutter/material.dart';
import 'package:missed_prayers/src/core/utils/app_helpers.dart';

class InfoItem extends StatelessWidget {
  final String text;
  final DateTime date;

  const InfoItem({super.key, required this.text, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
        ),
        Text(AppHelpers.formatDate(date)),
      ],
    );
  }
}
