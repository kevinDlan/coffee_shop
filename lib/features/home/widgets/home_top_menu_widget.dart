import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:coffee_shop/data/coffee_data_list.dart';
import 'package:coffee_shop/features/home/models/coffee.dart';
import 'package:coffee_shop/features/home/widgets/coffee_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTopMenuWidget extends StatefulWidget {
  const HomeTopMenuWidget({super.key});

  @override
  State<HomeTopMenuWidget> createState() => _HomeTopMenuWidgetState();
}

class _HomeTopMenuWidgetState extends State<HomeTopMenuWidget> {
  final List<String> menuItems = [
    "Cappuccino",
    "Machiato",
    "Latte",
    "Americano"
  ];

  List<Coffee> coffees = [];

  Future<void> getCoffees({required String category}) async {
    List<Map<String, dynamic>> data = await CoffeeDataList.fetchCoffee();
    List<Coffee> coffs = [];

    if (data.isNotEmpty) {
      for (Map<String, dynamic> coffee in data) {
        if (coffee['category'] == category) {
          coffs.add(Coffee.fromMap(coffee));
        }
      }

      setState(() {
        coffees = coffs;
      });
    }
  }

  int currentIndex = 0;

  @override
  void initState() {
    getCoffees(category: "cappuccino");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: height * 6.5,
          child: ListView.builder(
              itemCount: 4,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  margin: const EdgeInsets.only(left: 10),
                  duration: const Duration(milliseconds: 300),
                  width: menuItems[index].length * 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.transparent),
                      color: currentIndex == index
                          ? Pallete.primaryColor
                          : Pallete.whiteColor),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                        getCoffees(
                            category: menuItems[currentIndex].toLowerCase());
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Center(
                        child: Text(
                          menuItems[index],
                          style: GoogleFonts.sora().copyWith(
                              fontSize: 14,
                              fontWeight: currentIndex == index
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: currentIndex == index
                                  ? Pallete.whiteColor
                                  : Pallete.unselectMenuHomeMenuItemColor),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: coffees.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.67),
                itemBuilder: (context, index) {
                  return CoffeWidget(coffee: coffees[index]);
                }),
          ),
        )
      ],
    );
  }
}
