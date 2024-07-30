import 'dart:async';

import 'package:cross_fit/core/components/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cross_fit/injector.dart' as di;

import '../../core/routes/app_router.dart';
import '../../core/shared/user_utils.dart';
import '../../core/styles/colors/colors.dart';
import '../../core/utils/assets_manager.dart';
import '../../core/local/caching_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final sharedPreferences = di.sl<SharedPreferences>();
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        final isFinished =
            sharedPreferences.getBool(CachingKeys.finishBoarding);
        if (isFinished != true) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.onBoardingRoute, (route) => false);
        }
        else
        {
          if(UserUtils.uid==null){
             Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginRoute, (route) => false);
          } else{
              Navigator.pushNamedAndRemoveUntil(
                context, Routes.layoutRoute, (route) => false);
          }
         
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kMediumBlack,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImgAssets.splash,
                height: 200.h,
                width: 200.w,
              ),
              AppText(
                'CrossFit',
                color: AppColors.kGreen,
                fontSize: 35.sp,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
        ));
  }
}
