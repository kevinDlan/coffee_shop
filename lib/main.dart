import 'package:coffee_shop/common/theme/app_theme.dart';
import 'package:coffee_shop/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Coffee Shop',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}

// https://www.youtube.com/watch?v=zOPu26W48AA
