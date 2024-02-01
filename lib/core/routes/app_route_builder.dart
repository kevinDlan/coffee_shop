import 'package:coffee_shop/app_wrapper.dart';
import 'package:coffee_shop/features/delivery/screens/delivery_screen.dart';
import 'package:coffee_shop/features/home/models/coffee.dart';
import 'package:coffee_shop/features/home/screens/coffee_detail_screen.dart';
import 'package:coffee_shop/features/home/screens/home_screen.dart';
import 'package:coffee_shop/features/home/screens/order_coffee_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouteBuilder {
  static Widget appWrapperScreenBuilder(
          BuildContext context, GoRouterState state) =>
      const AppWrapper();

  static Widget homeScreenBuilder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  static Widget coffeeDetailScreenBuilder(
          BuildContext context, GoRouterState state) =>
      CoffeeDetailScreen(
        coffee: state.extra as Coffee,
      );

  static Widget orderCoffeScreenBuilder(
          BuildContext context, GoRouterState state) =>
      OrderCoffeeScreen(
        buyCoffeeData: state.extra as Coffee,
      );
  static Widget deliveryScreenBuilder(
          BuildContext context, GoRouterState state) =>
      const DeliveryScreen();
}
