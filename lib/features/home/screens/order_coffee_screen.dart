import 'package:coffee_shop/enums/order_option.dart';
import 'package:coffee_shop/features/delivery/screens/delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/theme/pallete.dart';
import '../models/coffee.dart';
import '../widgets/custom_button.dart';

class OrderCoffeeScreen extends StatefulWidget {
  const OrderCoffeeScreen({super.key, required this.buyCoffeeData});
  final Coffee buyCoffeeData;
  static const String routeName = "order";

  @override
  State<OrderCoffeeScreen> createState() => _OrderCoffeeScreenState();
}

class _OrderCoffeeScreenState extends State<OrderCoffeeScreen> {
  OrderOption orderOption = OrderOption.deliver;
  int orderQuanty = 1;

  double unitPrice = 0.0;
  double price = 0.0;
  double totalPrice = 0.0;

  void selectOption(OrderOption option) {
    setState(() {
      orderOption = option;
    });
  }

  void incrementCoffeQuantity() {
    setState(() {
      orderQuanty++;
      price = unitPrice * orderQuanty;
      totalPrice = price + 1.0;
    });
  }

  void decrementCoffeQuantity() {
    if (orderQuanty > 1) {
      setState(() {
        orderQuanty--;
        price = unitPrice * orderQuanty;
        totalPrice = price + 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    unitPrice = widget.buyCoffeeData.price;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Order",
          style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Pallete.titleColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 68,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Pallete.greyColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: orderOption == OrderOption.deliver
                              ? Pallete.primaryColor
                              : Colors.transparent,
                          border: Border.all(style: BorderStyle.none),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => selectOption(OrderOption.deliver),
                            borderRadius: BorderRadius.circular(15),
                            child: Center(
                              child: Text(
                                "Deliver",
                                style: GoogleFonts.sora(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: orderOption == OrderOption.deliver
                                        ? Pallete.whiteColor
                                        : Pallete.titleColor),
                              ),
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: orderOption == OrderOption.pickUp
                              ? Pallete.primaryColor
                              : Colors.transparent,
                          border: Border.all(style: BorderStyle.none),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => selectOption(OrderOption.pickUp),
                            borderRadius: BorderRadius.circular(15),
                            child: Center(
                              child: Text(
                                "Pick Up",
                                style: GoogleFonts.sora(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: orderOption == OrderOption.pickUp
                                        ? Pallete.whiteColor
                                        : Pallete.titleColor),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Delivery Address",
                    style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Pallete.titleColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Abidan, Cocody-Riviear 2",
                    style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Pallete.titleColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                    style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Pallete.subTitleColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Pallete.greyColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/edit.png"),
                            Text(
                              "Edit Address",
                              style: GoogleFonts.sora(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.lightTextColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 110,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Pallete.greyColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/document.png"),
                            Text(
                              "Add Note",
                              style: GoogleFonts.sora(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.lightTextColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 5,
                    color: Color(0xFFEAEAEA),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  widget.buyCoffeeData.image,
                                ))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  widget.buyCoffeeData.name,
                                  style: GoogleFonts.sora(
                                      color: Pallete.titleColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.buyCoffeeData.content,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sora(
                                      color: Pallete.subTitleColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Pallete.subTitleColor,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: decrementCoffeQuantity,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Center(
                                        child: Text(
                                          "-",
                                          style: GoogleFonts.sora(
                                              color: Pallete.subTitleColor,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  orderQuanty.toString(),
                                  style: GoogleFonts.sora(
                                      color: Pallete.titleColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Pallete.subTitleColor,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: incrementCoffeQuantity,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Center(
                                        child: Text(
                                          "+",
                                          style: GoogleFonts.sora(
                                              color: Pallete.titleColor,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(height: 7, color: Pallete.dividerColor),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 68,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFEAEAEA),
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(15)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(15),
                        child: Center(
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/discount.png",
                              fit: BoxFit.cover,
                              width: 25,
                            ),
                            title: Text(
                              '1 Discount is applied',
                              style: GoogleFonts.sora(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Pallete.titleColor),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Pallete.titleColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Payment Summary",
                    style: GoogleFonts.sora(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Pallete.titleColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Pallete.titleColor),
                      ),
                      Text(
                        price != 0.0
                            ? "\$ $price"
                            : "\$ ${widget.buyCoffeeData.price}",
                        style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Pallete.titleColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Pallete.titleColor),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "\$ 2.0",
                          style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              color: Pallete.titleColor),
                        ),
                        TextSpan(
                            text: "  \$ 1.0",
                            style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Pallete.titleColor))
                      ]))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 5,
                    color: Color(0xFFEAEAEA),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Pallete.titleColor),
                      ),
                      Text(
                        totalPrice != 0.0
                            ? "\$ $totalPrice"
                            : "\$ ${widget.buyCoffeeData.price + 1.0}",
                        style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Pallete.titleColor),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 165,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/money.png"),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 150,
                      height: 30,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: Pallete.greyColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Pallete.primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Cash",
                                style: GoogleFonts.sora(
                                    color: Pallete.whiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Text(
                            totalPrice != 0.0
                                ? "\$ $totalPrice"
                                : "\$ ${widget.buyCoffeeData.price + 1.0}",
                            style: GoogleFonts.sora(
                                color: Pallete.titleColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Pallete.moreIconColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.more_horiz_outlined,
                    color: Pallete.whiteColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: CustomButtom(
                text: "Order",
                leftMargin: 0,
                onClick: () {
                  context.pushNamed(DeliveryScreen.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Mapscreen Tuto
// https://www.youtube.com/watch?v=zO31iSQZ2Y8

// Package link
// https://pub.dev/packages/google_maps_flutter

// ios api key : AIzaSyARGF1DjFNjCiNRzuv4JPLXijL59IfjS4U
// androi api key : AIzaSyB4KB3KFzUYfZTm_R_YFPS8MLLJIEH_npE
