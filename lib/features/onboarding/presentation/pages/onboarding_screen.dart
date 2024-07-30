import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:cross_fit/features/onboarding/presentation/widgets/circular_button.dart';
import 'package:cross_fit/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:cross_fit/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/default_text_button.dart';
import '../../../../core/styles/colors/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = OnBoardingCubit.get(context);
        return Scaffold(
            body: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: cubit.boardController,
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.boarding.length,
              onPageChanged: (int index) {
                cubit.indexListener(index);
              },
              itemBuilder: (_, index) =>
                  BoardingItem(model: cubit.boarding[index]),
            )),
            70.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  DefaultTextButton(title: 'Skip', onPressed: () {
                    cubit.navigateToLogin(context);
                  },),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        cubit.boarding.length,
                        (index) {
                          bool isCurrent = index == cubit.currentIndex;
                          return PageIndicator(
                              width: isCurrent ? 45.w : 15.w,
                              color: isCurrent
                                  ? AppColors.kGreen
                                  : Colors.grey);
                        }),
                  )),
                  CircularButton(
                    onPressed: () {
                      cubit.changeIndex(context);
                    },
                    icon: cubit.isLast ? Icons.done : Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
            20.heightSpace,
          ],
        ));
      },
    );
  }
}
