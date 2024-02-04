import 'package:coffee_shop/features/home/widgets/promo_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/theme/pallete.dart';
import '../widgets/home_search_bar_widget.dart';
import '../widgets/home_top_menu_widget.dart';
import 'package:animate_do/animate_do.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    double width = MediaQuery.of(context).size.width * .01;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 42,
          child: Stack(children: [
            Container(
              padding: EdgeInsets.only(
                  left: width * 7, top: height * 5, right: width * 7),
              height: height * 32,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [.09, 1],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    // Pallete.appBarLinearGradientBeginColor,
                    Pallete.appBarLinearGradientEndColor,
                    Pallete.appBarLinearGradientEndColor
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: GoogleFonts.sora().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.textlightDarkColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Abidjan, Ivoiry Coast',
                                  style: GoogleFonts.sora().copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Pallete.textGreyColor,
                                      letterSpacing: .12),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.check,
                                  size: 15,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/profil.png")),
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  const HomeSearchBarWidget()
                ],
              ),
            ),
            Positioned(
              top: height * 23,
              child: ZoomIn(
                child: Container(
                  height: height * 19,
                  width: width * 85,
                  padding: const EdgeInsets.only(left: 25, top: 5),
                  margin: EdgeInsets.only(left: width * 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/home_coffee.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.centerRight)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PromoWidget(),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 8),
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Text(
                          "Buy one get",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.sora(
                              fontSize: 30,
                              wordSpacing: 5,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 8),
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Text(
                          "one FREE",
                          style: GoogleFonts.sora(
                              fontSize: 30,
                              height: 1.3,
                              wordSpacing: 5,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
        // Top menu
        const Expanded(child: HomeTopMenuWidget())
      ],
    );
  }
}
