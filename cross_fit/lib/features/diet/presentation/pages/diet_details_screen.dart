import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/diet/presentation/manager/diet_cubit.dart';
import 'package:cross_fit/features/diet/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/build_meals_container.dart';

class DietDetailsScreen extends StatelessWidget {
  const DietDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietState>(
      builder: (context, state) {
        final dietCubit = context.read<DietCubit>();

        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const CustomSliverAppBar(),
              SliverToBoxAdapter(
                child: 15.heightSpace,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: 3,
                      (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 20.w),
                            child: BuildMealsContainer(
                              index,
                              diets: dietCubit.diets[index],
                            ),
                          ))),
            ],
          ),
        );
      },
    );
  }
}
