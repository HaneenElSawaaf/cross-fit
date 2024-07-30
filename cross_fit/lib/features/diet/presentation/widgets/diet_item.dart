import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../../core/shared/diet_model.dart';
import '../manager/diet_cubit.dart';
import '../../utils/diet_utils.dart';

class DietItem extends StatelessWidget {
  final DietCubit cubit;
  final DietModel nutritionalModel;
  final List<NutritionalItem> nutritionalItems;
  const DietItem(
      {Key? key,
      required this.cubit,
      required this.nutritionalItems,
      required this.nutritionalModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.kDarkBlack,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            cubit.goToDietDetailsScreen(context, cubit);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: AppText(
                      'Cross Fit Diet (Default)',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    )),
                    Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                      size: 25.sp,
                    ),
                  ],
                ),
                4.heightSpace,
                AppText('Recommended',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kGreen),
                6.heightSpace,
                AppText('${nutritionalModel.calories} Kcal',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kGreen),
                Wrap(
                    children: List.generate(
                            nutritionalItems.length,
                            (index) =>
                                _buildDetails(context, nutritionalItems[index]))
                        .map((e) => Padding(
                              padding: EdgeInsets.only(right: 10.w, top: 4.h),
                              child: e,
                            ))
                        .toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context, NutritionalItem nutritionalItem) {
    return Text.rich(TextSpan(
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: '${nutritionalItem.title}: ',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          TextSpan(
            text: '${nutritionalItem.value}g',
            style: TextStyle(
              color: AppColors.kGreen,
            ),
          ),
        ]));
  }
}
