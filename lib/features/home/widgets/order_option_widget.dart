import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/theme/pallete.dart';

class OrderOptionWidget extends StatelessWidget {
  const OrderOptionWidget({super.key, required this.text, required this.onTap});
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Pallete.primaryColor,
        border: Border.all(style: BorderStyle.none),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          borderRadius: BorderRadius.circular(15),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Pallete.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
