import 'package:animate_do/animate_do.dart';
import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:coffee_shop/enums/coffee_size.dart';
import 'package:coffee_shop/features/home/models/coffee.dart';
import 'package:coffee_shop/features/home/screens/order_coffee_screen.dart';
import 'package:coffee_shop/features/home/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailScreen extends StatefulWidget {
  const CoffeeDetailScreen({super.key, required this.coffee});
  final Coffee coffee;

  static const String routeName = 'coffee-detail';

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  CoffeSize coffeSize = CoffeSize.M;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Details',
          style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Pallete.titleColor),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Pallete.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                borderRadius: BorderRadius.circular(20),
                child: Icon(
                  !isFavorite
                      ? Icons.favorite_border_rounded
                      : Icons.favorite_rounded,
                  color: isFavorite ? Pallete.primaryColor : Colors.black,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZoomIn(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(widget.coffee.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.coffee.name,
              style: GoogleFonts.sora(
                  fontSize: 20,
                  color: Pallete.titleColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.coffee.content,
              style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Pallete.subTitleColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Pallete.startColor,
                      size: 27,
                    ),
                    Text(
                      widget.coffee.rating.toString(),
                      style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Pallete.titleColor),
                    ),
                    Text(
                      "(${widget.coffee.rating * 1000})",
                      style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Pallete.subTitleColor),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Pallete.homePageBgColor),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            "assets/images/coffe_bean_1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Pallete.homePageBgColor),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            "assets/images/coffe_bean_2.png",
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(height: 5, color: Color(0xFFEAEAEA)),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Description",
              style: GoogleFonts.sora(
                  fontSize: 20,
                  color: Pallete.titleColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            ReadMoreText(
              "Cappuccino, a beloved Italian coffee creation, combines rich espresso with steamed milk and a frothy layer of milk foam, creating a harmonious blend of strong, velvety flavors. This classic coffee beverage is characterized by its distinctive three-layer presentation, offering a perfect balance of intensity and creaminess. Served in a small cup, the cappuccino is not just a drink; it's a delightful experience that captivates coffee enthusiasts around the world.",
              style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Pallete.subTitleColor),
              trimLength: 180,
              trimCollapsedText: 'Read More',
              trimExpandedText: 'Read less',
              moreStyle: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Pallete.primaryColor),
              lessStyle: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Pallete.primaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Size",
              style: GoogleFonts.sora(
                  fontSize: 20,
                  color: Pallete.titleColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: coffeSize == CoffeSize.S
                          ? Pallete.primaryLightColor
                          : Pallete.whiteColor,
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: coffeSize == CoffeSize.S
                              ? Pallete.primaryColor
                              : Pallete.greyLightColor)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => setState(() {
                        coffeSize = CoffeSize.S;
                      }),
                      child: Center(
                        child: Text(
                          "S",
                          style: GoogleFonts.sora(
                              fontSize: 16,
                              color: coffeSize == CoffeSize.S
                                  ? Pallete.primaryColor
                                  : Pallete.coffeNoActiveTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: coffeSize == CoffeSize.M
                          ? Pallete.primaryLightColor
                          : Pallete.whiteColor,
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: coffeSize == CoffeSize.M
                              ? Pallete.primaryColor
                              : Pallete.greyLightColor)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => setState(() {
                        coffeSize = CoffeSize.M;
                      }),
                      child: Center(
                        child: Text(
                          "M",
                          style: GoogleFonts.sora(
                              fontSize: 16,
                              color: coffeSize == CoffeSize.M
                                  ? Pallete.primaryColor
                                  : Pallete.coffeNoActiveTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: coffeSize == CoffeSize.L
                          ? Pallete.primaryLightColor
                          : Pallete.whiteColor,
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: coffeSize == CoffeSize.L
                              ? Pallete.primaryColor
                              : Pallete.greyLightColor)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => setState(() {
                        coffeSize = CoffeSize.L;
                      }),
                      child: Center(
                        child: Text(
                          "L",
                          style: GoogleFonts.sora(
                              fontSize: 16,
                              color: coffeSize == CoffeSize.L
                                  ? Pallete.primaryColor
                                  : Pallete.coffeNoActiveTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x40E4E4E4),
              blurRadius: 32.0,
            ),
          ],
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Pallete.subTitleColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$ ${widget.coffee.price}",
                  style: GoogleFonts.sora(
                      color: Pallete.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Expanded(
              child: CustomButtom(
                text: "Buy Now",
                leftMargin: 20,
                onClick: () {
                  context.pushNamed(OrderCoffeeScreen.routeName,
                      extra: widget.coffee);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
