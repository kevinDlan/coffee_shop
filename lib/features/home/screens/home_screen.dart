import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:coffee_shop/features/cart/screens/cart_screen.dart';
import 'package:coffee_shop/features/home/screens/home_content_screen.dart';
import 'package:coffee_shop/features/notification/screens/notification_screen.dart';
import 'package:coffee_shop/features/wishlist/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavBarCurrentIndex = 0;
  final List<IconData> menuItemsIcon = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.solidBell
  ];

  final List<Widget> appPage = const [
    HomeContentScreen(),
    WishlistScreen(),
    CartScreen(),
    NotificationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .01;
    return Scaffold(
      backgroundColor: Pallete.homePageBgColor,
      body: appPage[bottomNavBarCurrentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: width * 25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => setState(() {
                      bottomNavBarCurrentIndex = index;
                    }),
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          menuItemsIcon[index],
                          color: bottomNavBarCurrentIndex == index
                              ? Pallete.primaryColor
                              : Pallete.unselectIconColor,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 2.5, top: 5),
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              bottomNavBarCurrentIndex == index
                                  ? Pallete.indicatorGradiantBeginColor
                                  : Pallete.whiteColor,
                              bottomNavBarCurrentIndex == index
                                  ? Pallete.primaryColor
                                  : Pallete.whiteColor
                            ]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
