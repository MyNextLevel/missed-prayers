import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/colors.gen.dart';

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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.5, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        },
        child: Text(
          title,
          key: ValueKey<String>(title),
          style: GoogleFonts.prompt(
            color: ColorName.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
