import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../utils/diet_utils.dart';
import '../manager/diet_cubit.dart';
import 'build_meal_item.dart';

class BuildMealsContainer extends StatelessWidget {
  final DietItem diets;
  final int index;
  const BuildMealsContainer(this.index,{Key? key, required this.diets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DietCubit>();
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.kGreen,
              radius: 5.sp,
            ),
            5.widthSpace,
            AppText(
              diets.title,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ],
        ),
        5.heightSpace,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kDarkBlack,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                  children: List.generate(
                cubit.diets[index].meals.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: BuildMealItem(meal: diets.meals[index]),
                ),
              ))),
        ),
      ],
    );
  }
}
