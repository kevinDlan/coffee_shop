import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Pallete.redColor),
      child: Center(
        child: Text(
          'Promo',
          style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Pallete.whiteColor),
        ),
      ),
    );
  }
}
