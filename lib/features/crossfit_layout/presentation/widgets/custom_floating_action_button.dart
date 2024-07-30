import 'package:cross_fit/core/styles/colors/colors.dart';
import 'package:cross_fit/features/crossfit_layout/presentation/manager/cross_fit_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CrossFitLayoutCubit.get(context);
    return SizedBox(
      height: 50.sp,
      width: 50.sp,
      child: FloatingActionButton(
        onPressed: () {
          cubit.changeIndex(4);
        },
        backgroundColor: AppColors.kGreen,
        child: Icon(Icons.add,color: Colors.white,size: 40.sp,),
      ),
    );
  }
}