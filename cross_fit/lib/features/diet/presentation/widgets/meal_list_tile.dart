import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/styles/colors/colors.dart';

class MealListTile extends StatelessWidget {
  final String title;
  final String unit;
  final double value;
  const MealListTile(
      {super.key,
      required this.title,
      required this.value,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(title, fontSize: 15.sp, fontWeight: FontWeight.bold),
        const Spacer(),
        Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.withOpacity(0.8)),
            children: [
              TextSpan(text: '$value'),
              TextSpan(
                  text: ' $unit',
                  style: TextStyle(
                      color: AppColors.kGreen, fontWeight: FontWeight.bold))
            ]))
      ],
    );
  }
}
