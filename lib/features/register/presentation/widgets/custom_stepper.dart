import 'package:cross_fit/features/register/presentation/manager/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/colors.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = RegisterCubit.get(context);
        final currentPage = cubit.currentPage;
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(cubit.registerDetailsViews.length, (index) {
              return Row(children: [
                _buildCircle(currentPage,index),
                Stack(
                  children: [
                    Container(
                      width: 70.w,
                      height: 2.h,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: currentPage>=index?70.w:0,
                      height: 2.h,
                      decoration: BoxDecoration(
                          color: AppColors.kGreen,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  ],
                ),
                if(index == cubit.registerDetailsViews.length-1)
                  _buildCircle(currentPage,index)
              ],);
            })
        );
      },
    );
  }

  Widget _buildCircle(int currentPage,int index) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        height: 14.h,
        width: 14.w,
        decoration: BoxDecoration(
          color: currentPage>=index?AppColors.kGreen:Colors.grey,
          shape: BoxShape.circle,
        ),
      );
}
