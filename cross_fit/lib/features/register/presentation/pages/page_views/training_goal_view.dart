import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/register/presentation/widgets/description_item.dart';
import 'package:cross_fit/features/register/presentation/widgets/goal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/goal_model.dart';



class TrainingGoalView extends StatelessWidget {
  const TrainingGoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const DescriptionItem(
                content: 'Our goals are different, choose your training goal'),
            15.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: List.generate(goals.length, (index) {
                  return GoalItem(
                    index,
                    title: goals[index].title,
                    icon: goals[index].icon,
                    description: goals[index].description,
                  );
                }),

              ),
            ),
            60.heightSpace,
          ],
        ),
      ),
    );
  }
}
