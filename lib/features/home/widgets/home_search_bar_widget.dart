import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/theme/pallete.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    return Container(
      height: height * 7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF313131)),
      child: TextField(
        cursorColor: Pallete.primaryLightColor,
        cursorHeight: 20,
        autofocus: false,
        style: GoogleFonts.sora().copyWith(fontSize: 15),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset("assets/images/search-normal.png"),
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.only(top: 3.0, right: 5),
            decoration: BoxDecoration(
                color: Pallete.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Image.asset('assets/images/filter.png'),
              ),
            ),
          ),
          hintText: "Search Coffee",
          hintStyle: GoogleFonts.sora().copyWith(),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
