import 'package:cross_fit/core/styles/colors/colors.dart';
import 'package:cross_fit/features/crossfit_layout/utils/bottom_nav_model.dart';
import 'package:cross_fit/features/crossfit_layout/presentation/manager/cross_fit_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CrossFitLayoutCubit, CrossFitLayoutState>(
      buildWhen: (previous, current) => current is ChangeIndex,
      builder: (context, state) {
        final cubit = CrossFitLayoutCubit.get(context);
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: AppColors.kDarkBlack,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bottomNavItems.length, (index) {
                  bool isSelected = cubit.currentPage == index;
                  return InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      cubit.changeIndex(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 45.w,
                            child: Icon(
                              bottomNavItems[index].icon,
                              color: isSelected
                                  ? AppColors.kGreen
                                  : Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            bottomNavItems[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.kGreen
                                  : Colors.white.withOpacity(0.5),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
          ),
        );
      },
    );
  }
}

