import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/colors.gen.dart';

class SelectStartPrayer extends StatelessWidget {
  final Function(DateTime) onDateChanged;

  const SelectStartPrayer({
    super.key,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Namozni boshlagan vaqtingiz',
          textAlign: TextAlign.center,
          style: GoogleFonts.prompt(
            color: ColorName.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Shunga qarab qazo namozlaringiz hisoblanadi',
          textAlign: TextAlign.center,
          style: GoogleFonts.prompt(
            color: ColorName.hintTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 180,
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
