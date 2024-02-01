import 'package:coffee_shop/features/home/screens/home_screen.dart';
import 'package:coffee_shop/features/onboarding/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});
  static const String routeName = "app-wrapper";

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool onboardingIsView = false;

  @override
  Widget build(BuildContext context) {
    return !onboardingIsView ? const OnboardingScreen() : const HomeScreen();
  }
}
