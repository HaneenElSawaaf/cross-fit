import 'package:cross_fit/core/components/app_text.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/register/presentation/manager/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/colors.dart';

class GenderItem extends StatelessWidget {
  final String title;
  final String image;
  final int index;
  const GenderItem({Key? key, required this.title, required this.image, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = RegisterCubit.get(context);
        final isSelected = cubit.selectedGender == index;
        return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      cubit.selectGender(index);
                    },
                    child: Container(
                      height: 130.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                        border: isSelected? Border.all(color: AppColors.kGreen, width: 3):null,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  5.heightSpace,
                  AppText(title,
                      fontSize: 20.sp, fontWeight: FontWeight.w700),
                ],
              ),
            ));
      },
    );
  }
}
