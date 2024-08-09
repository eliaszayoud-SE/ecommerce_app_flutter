import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'PlayfairDisplay',
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.grey[50],
  iconTheme: const IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    )
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  foregroundColor: AppColor.white
  ),

  textTheme: const TextTheme(
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.black),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16),
  ),
  primarySwatch: Colors.grey,
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.black),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16),
  ),
  primarySwatch: Colors.grey,
);
