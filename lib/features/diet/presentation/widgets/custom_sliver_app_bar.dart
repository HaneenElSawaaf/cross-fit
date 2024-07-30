import 'package:cross_fit/core/utils/app_strings.dart';
import 'package:cross_fit/features/diet/presentation/widgets/schedule_date_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 150.h,
        backgroundColor: AppColors.kGreen,
        pinned: true,
        primary: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Text(AppStrings.appName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold)),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: const ScheduleDateItem(),
          ),
        ));
  }
}
