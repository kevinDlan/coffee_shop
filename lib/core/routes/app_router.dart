import 'package:coffee_shop/app_wrapper.dart';
import 'package:coffee_shop/core/routes/app_route_builder.dart';
import 'package:coffee_shop/core/routes/app_route_path.dart';
import 'package:coffee_shop/features/delivery/screens/delivery_screen.dart';
import 'package:coffee_shop/features/home/screens/coffee_detail_screen.dart';
import 'package:coffee_shop/features/home/screens/home_screen.dart';
import 'package:coffee_shop/features/home/screens/order_coffee_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
        name: AppWrapper.routeName,
        path: AppRoutePath.root,
        builder: AppRouteBuilder.appWrapperScreenBuilder),
    GoRoute(
        name: HomeScreen.routeName,
        path: AppRoutePath.home,
        builder: AppRouteBuilder.homeScreenBuilder),
    GoRoute(
        name: CoffeeDetailScreen.routeName,
        path: AppRoutePath.coffeeDetail,
        builder: AppRouteBuilder.coffeeDetailScreenBuilder),
    GoRoute(
        name: OrderCoffeeScreen.routeName,
        path: AppRoutePath.orderCoffee,
        builder: AppRouteBuilder.orderCoffeScreenBuilder),
    GoRoute(
      name: DeliveryScreen.routeName,
      path: AppRoutePath.delivery,
      builder: AppRouteBuilder.deliveryScreenBuilder,
    ),
  ]);

  static GoRouter get router => _router;
}
