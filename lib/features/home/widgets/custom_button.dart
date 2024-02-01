import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      required this.text,
      required this.leftMargin,
      required this.onClick});
  final String text;
  final double leftMargin;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Pallete.primaryColor,
        border: Border.all(style: BorderStyle.none),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onClick();
          },
          borderRadius: BorderRadius.circular(20),
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
