import 'package:cross_fit/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/styles/colors/colors.dart';
import 'core/styles/themes/app_theme.dart';

class CrossFitApp extends StatelessWidget {
  const CrossFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context,child){
        return MaterialApp(
          title: 'CrossFit',
          color: AppColors.kGreen,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: appTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
