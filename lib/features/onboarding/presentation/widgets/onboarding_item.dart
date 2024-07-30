import 'package:cross_fit/core/components/app_text.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../utils/onboarding_model.dart';

class BoardingItem extends StatelessWidget {
  final BoardingModel model;
  const BoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            model.image,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              AppText(
                model.title,
                color: AppColors.kGreen,
                textAlign: TextAlign.center,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
              30.heightSpace,
              Text(
                model.body,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColors.kGrey),
              ),
              15.heightSpace
            ],
          ),
        ),
      ],
    );
  }
}
