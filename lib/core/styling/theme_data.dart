import 'package:flutter/material.dart';
import 'package:logistics_manager_app/core/styling/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,

    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.primaryColor,
    ),
  );
}
