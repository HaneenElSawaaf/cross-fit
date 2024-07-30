import 'package:auto_size_text/auto_size_text.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/styles/colors/colors.dart';
import '../manager/register_cubit.dart';

class GoalItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final int index;

  const GoalItem(this.index,
      {Key? key,
        required this.title,
        required this.icon,
        required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Container(
          height: 150.h,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: RegisterCubit
                .get(context)
                .selectedTrainingGoal == index
                ? const Color(0xff166541)
                : AppColors.kDarkBlack,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              RegisterCubit.get(context).selectTrainingGoal(index);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: AppText(
                            title,
                            fontWeight: FontWeight.w600,
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                          icon,
                          color: AppColors.kGreen,
                          size: 25.sp,
                        ),
                      ),
                    ],
                  ),
                  15.heightSpace,
                  AutoSizeText(
                    description,
                    style: TextStyle(fontSize: 14.sp),
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
