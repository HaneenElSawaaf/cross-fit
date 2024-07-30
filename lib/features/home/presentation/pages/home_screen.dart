import 'dart:developer';

import 'package:cross_fit/core/components/app_text.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/home/presentation/manager/home_cubit.dart';
import 'package:cross_fit/features/home/presentation/widgets/meal_today_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/bar_chart.dart';
import '../widgets/circular_chart.dart';
import '../../../../core/components/custom_appbar.dart';
import 'package:cross_fit/injector.dart' as di;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<HomeCubit>()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          log('test');
          return Scaffold(
              appBar: const CustomAppBar(),
              body: state is DataLoaded
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(AppStrings.summary,
                                fontSize: 20, fontWeight: FontWeight.bold),
                            CircularChart(
                              data: state.nutritionalModel,
                            ),
                            12.heightSpace,
                            SizedBox(
                              height: 200.h,
                              child: BarChart(
                                nutritionalModel: state.nutritionalModel,
                              ),
                            ),
                            12.heightSpace,
                            const AppText(AppStrings.todayMeals,
                                fontSize: 20, fontWeight: FontWeight.bold),
                            12.heightSpace,
                            BlocBuilder<HomeCubit, HomeState>(
                              buildWhen: (previous, current) {
                                if (current is DataLoaded) {
                                  return true;
                                }
                                return false;
                              },
                              builder: (context, state) {
                                return SizedBox(
                                  height: 135.h,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return MealTodayItem(
                                          mealModel: (state).mealModel[index]);
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        (state as DataLoaded).mealModel.length,
                                  ),
                                );
                              },
                            ),
                            75.heightSpace,
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: SpinKitCircle(
                      color: AppColors.kGreen,
                    )));
        },
      ),
    );
  }
}
