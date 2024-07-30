import 'package:cross_fit/core/components/amount_container.dart';
import 'package:cross_fit/core/components/diet_image_item.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../diet/data/models/meal_model.dart';
import '../../../diet/utils/meal_utils.dart';
import '../manager/home_cubit.dart';

class MealTodayItem extends StatelessWidget {
  final MealModel mealModel;
  const MealTodayItem({Key? key, required this.mealModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Container(
        height: 128.h,
        width: 230.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: AppColors.kDarkBlack,
            borderRadius: BorderRadius.circular(10)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.mealRoute,
                  arguments: MealScreenArguments(
                      mealModel: mealModel,
                      dietModel: HomeCubit.get(context).nutritionalData));
            },
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: AppText('Breakfast',
                              fontSize: 10.sp, fontWeight: FontWeight.bold)),
                      AmountContainer(mealModel.calories),
                    ],
                  ),
                  15.heightSpace,
                  Expanded(
                    child: Row(
                        children: List.generate(
                      2,
                      (index) => Expanded(
                        child: Column(
                          children: [
                            DietImageItem(imageUrl: mealModel.image),
                            8.heightSpace,
                            AppText(
                              mealModel.title,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
