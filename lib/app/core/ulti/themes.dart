import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task/app/core/values/colors.dart';

final ThemeData myTheme = ThemeData(
  primaryColor:primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: secondary,
  ),
  fontFamily: "FFShamelFamily",
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'FFShamelFamily',
    ),
    headlineLarge: TextStyle(
      color: secondary,
      fontWeight: FontWeight.bold,
      fontSize: 15.sp,
      fontFamily: 'FFShamelFamily',
    ),
    bodySmall: TextStyle(
      color: const Color(0xFFACACAC),
      fontWeight: FontWeight.w600,
      fontSize: 11.sp,
      fontFamily: 'FFShamelFamily',
    ),
    bodyMedium: TextStyle(
      color: secondary,
      fontSize: 11.sp,
    ),
    displayMedium: TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 10.sp,
      fontFamily: 'FFShamelFamily',
    ),
    labelMedium: TextStyle(
      color: secondary,
      fontWeight: FontWeight.bold,
      fontSize: 13.sp,
      fontFamily: 'FFShamelFamily',
    ),
    labelSmall: TextStyle(
        fontSize: 10.sp, color: Colors.grey[400], fontFamily: "FFShamelFamily"),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
);
