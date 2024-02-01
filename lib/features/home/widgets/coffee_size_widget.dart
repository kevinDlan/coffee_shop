import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/theme/pallete.dart';

class CoffeeSizeWidget extends StatelessWidget {
  const CoffeeSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Pallete.primaryLightColor,
          border: Border.all(
              style: BorderStyle.solid, color: Pallete.greyLightColor)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Center(
            child: Text(
              "S",
              style: GoogleFonts.sora(
                  fontSize: 16, color: Pallete.coffeNoActiveTextColor),
            ),
          ),
        ),
      ),
    );
  }
}
