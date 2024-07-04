import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/colors.gen.dart';

class SelectFirstEhtilam extends StatelessWidget {
  final Function(DateTime) onDateChanged;

  const SelectFirstEhtilam({
    super.key,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Birinchi marta ehtilom/hayz paytingizni kiriting',
          textAlign: TextAlign.center,
          style: GoogleFonts.prompt(
            color: ColorName.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Musulmon kishiga shu vaqtdan boshlab namoz farz bo’ladi.',
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
