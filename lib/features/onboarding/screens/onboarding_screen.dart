import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:coffee_shop/features/home/screens/home_screen.dart';
import 'package:coffee_shop/features/home/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "onboarding";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 72,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/onboarding.png"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              height: height * 30,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color(0xff020101),
              child: Column(
                children: [
                  Text(
                    'Coffee so good, your taste buds, will love it.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                        color: Pallete.whiteColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The best grain, the finest road, the powerful flavor",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Pallete.subTitleColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 80,
                    child: CustomButtom(
                        text: "Get Started",
                        leftMargin: 0.0,
                        onClick: () =>
                            context.pushReplacementNamed(HomeScreen.routeName)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
