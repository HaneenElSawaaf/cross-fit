import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/diet/presentation/manager/diet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/styles/colors/colors.dart';

class ScheduleDateItem extends StatelessWidget {
  const ScheduleDateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietState>(
      builder: (context, state) {
        final cubit = DietCubit.get(context);
        final dates = cubit.getDates;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              7,
              (index) => Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: index == cubit.currentDateIndex
                            ? AppColors.kDarkBlack.withOpacity(0.5)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(40)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        cubit.changeCurrentDateIndex(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppText(
                              DateFormat('EEE').format(dates[index]),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            4.heightSpace,
                            Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: EdgeInsets.all(5.r),
                                  child: AppText(
                                    DateFormat('dd').format(dates[index]),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  )),
        );
      },
    );
  }
}
