import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missed_prayers/src/gen/colors.gen.dart';

class AcceptButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const AcceptButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: ColorName.primary,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: GoogleFonts.prompt(
          color: ColorName.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
