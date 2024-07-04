import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missed_prayers/src/presentation/pages/auth/widgets/info_item.dart';

import '../../../../gen/colors.gen.dart';

class ConfirmInfo extends StatelessWidget {
  final DateTime birthdate;
  final DateTime ehtilam;
  final DateTime startPrayer;

  const ConfirmInfo({
    super.key,
    required this.birthdate,
    required this.ehtilam,
    required this.startPrayer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ma’lumotlaringiz to’g’riligini tekshiring',
          textAlign: TextAlign.center,
          style: GoogleFonts.prompt(
            color: ColorName.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        InfoItem(text: 'Tug’ilgan kuningiz:', date: birthdate),
        InfoItem(text: 'Ehtilom/hayz vaqti:', date: ehtilam),
        InfoItem(text: 'Namozni boshladingiz:', date: startPrayer),
      ],
    );
  }
}
