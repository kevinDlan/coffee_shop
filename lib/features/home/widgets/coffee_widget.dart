import 'package:animate_do/animate_do.dart';
import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:coffee_shop/features/home/models/coffee.dart';
import 'package:coffee_shop/features/home/screens/coffee_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeWidget extends StatelessWidget {
  const CoffeWidget({super.key, required this.coffee});
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Pallete.whiteColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () =>
              context.pushNamed(CoffeeDetailScreen.routeName, extra: coffee),
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZoomIn(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(coffee.image),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Pallete.startColor,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3, top: 3),
                            child: Text(
                              coffee.rating.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sora(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Pallete.whiteColor),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Pallete.titleColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      coffee.content,
                      style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Pallete.subTitleColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${coffee.price}",
                          style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Pallete.unselectMenuHomeMenuItemColor),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Pallete.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Pallete.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
              // ClipRRect(,
              //   borderRadius: BorderRadius.circular(20),
              //   child: Image.asset(image),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
