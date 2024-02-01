import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: Pallete.whiteColor,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Pallete.whiteColor),
    primaryColor: Pallete.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.whiteColor,
      elevation: 0,
    ),
  );
}
