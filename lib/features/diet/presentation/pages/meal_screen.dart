import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/shared/diet_model.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../profile/presentation/widgets/blurred_image.dart';
import '../../../profile/presentation/widgets/rounded_body.dart';
import '../../data/models/meal_model.dart';
import '../../utils/meal_utils.dart';
import '../widgets/gradient_circular_progress.dart';
import '../widgets/meal_list_tile.dart';

class MealScreen extends StatelessWidget {
  final MealModel mealModel;
  final DietModel dietModel;
  const MealScreen(
      {super.key, required this.mealModel, required this.dietModel});

  @override
  Widget build(BuildContext context) {
    List<MealQuantity> mealQuantities = [
      MealQuantity(
        title: 'Caories',
        value: mealModel.calories,
        dividerValue: dietModel.calories,
      ),
      MealQuantity(
        title: 'Protein',
        value: mealModel.protein,
        dividerValue: dietModel.proteins,
      ),
    ];
    return Scaffold(
        body: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        BlurredImage(imageUrl: mealModel.image),
        Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 27.sp,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
        Positioned(
          top: 240.h,
          child: RoundedBody(
            child: Padding(
                padding: EdgeInsets.only(top: 15.h, left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      mealModel.title,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    15.heightSpace,
                    MealListTile(
                      title: 'Calories',
                      value: mealModel.calories,
                      unit: 'kcal',
                    ),
                    10.heightSpace,
                    MealListTile(
                      title: 'Protein',
                      value: mealModel.protein,
                      unit: 'g',
                    ),
                    45.heightSpace,
                    Row(
                        children: List.generate(mealQuantities.length, (index) {
                      final quantity = mealQuantities[index];
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Container(
                            height: 150.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.kDarkBlack,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Column(children: [
                                AppText(
                                  mealQuantities[index].title,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                AppText(
                                  '${quantity.value} / ${quantity.dividerValue}',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kGreen,
                                ),
                                12.heightSpace,
                                GradientCircularProgressIndicator(
                                  radius: 35.r,
                                  value: quantity.value / quantity.dividerValue,
                                  gradient: AppColors.pinkGradient,
                                  strokeWidth: 7,
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    }))
                  ],
                )),
          ),
        )
      ],
    ));
  }
}
