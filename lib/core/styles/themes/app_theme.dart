import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../colors/colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.kGreen,
    scaffoldBackgroundColor: AppColors.kMediumBlack,
    colorScheme: ColorScheme.dark(
      primary: AppColors.kGreen,
    ),
    fontFamily: FontsConstants.poppinsFont,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kMediumBlack,
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.kGreen,
      ),
    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    )
  );
}
