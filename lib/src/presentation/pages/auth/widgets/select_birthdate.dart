import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/colors.gen.dart';

class SelectBirthdate extends StatelessWidget {
  final Function(DateTime) onDateChanged;

  const SelectBirthdate({
    super.key,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tug’ilgan kuningiz',
          textAlign: TextAlign.center,
          style: GoogleFonts.prompt(
            color: ColorName.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            onDateTimeChanged: onDateChanged,
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            maximumDate: DateTime.now(),
          ),
        ),
      ],
    );
  }
}
