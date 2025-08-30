import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final light = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    foregroundColor: Colors.white,
    titleTextStyle: AppTextSyles.textpopns16color,
    toolbarTextStyle: AppTextSyles.textpopns20color,
  ),
  buttonTheme: ButtonThemeData(buttonColor: Constants.buttonColor),
  textTheme: TextTheme(
    bodyMedium: AppTextSyles.textpopns18color,
    bodySmall: AppTextSyles.textpopns14color,

    labelLarge: AppTextSyles.textpopns24owcolor,
    titleMedium: AppTextSyles.textpopns20color,

    titleLarge: AppTextSyles.textpopns16color,
    labelSmall: AppTextSyles.textpopns12Color,
    titleSmall: TextStyle(
      fontSize: 10.sp,
      color: Color(0xFF001640),
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(
      fontSize: 8.sp,
      color: Color(0xFF001640),
      fontFamily: 'Poppins',
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Constants.Textfeildborder,
      textStyle: TextStyle(color: Colors.black12),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTextSyles.textpopns12Color,
  ),
  cardTheme: CardThemeData(color: Colors.black),
);

final dark = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    foregroundColor: Colors.black,
    titleTextStyle: AppTextSyles.textpopnsbDarkMOde16color,
    toolbarTextStyle: TextStyle(
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
  ),
  buttonTheme: ButtonThemeData(buttonColor: Constants.buttonColor),
  textTheme: TextTheme(
    bodyMedium: AppTextSyles.textpopns18wcolor,
    bodySmall: AppTextSyles.textpopns14wcolor,
    labelSmall: AppTextSyles.textpopns12wColor,
    labelLarge: AppTextSyles.textpopns24DarkModeowcolor,
    titleLarge: AppTextSyles.textpopns16wcolor,
    titleMedium: AppTextSyles.textpopns20color,
    titleSmall: TextStyle(
      fontSize: 10.sp,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(
      fontSize: 8.sp,
      color: Colors.white,
      fontFamily: 'Poppins',
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Constants.Textfeildborder,
      textStyle: TextStyle(color: Colors.blue),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  cardTheme: CardThemeData(color: Colors.grey),
  navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.grey),
);
