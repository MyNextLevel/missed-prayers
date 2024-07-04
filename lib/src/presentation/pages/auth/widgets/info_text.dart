import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/colors.gen.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Qazo namozlaringizni aniqlash uchun bizga ba’zi ma’lumotlaringiz kerak bo’ladi.',
        textAlign: TextAlign.center,
        style: GoogleFonts.prompt(
          color: ColorName.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
