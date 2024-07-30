import 'package:cross_fit/core/components/custom_appbar.dart';
import 'package:cross_fit/features/diet/presentation/manager/diet_cubit.dart';
import 'package:cross_fit/features/diet/presentation/widgets/diet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cross_fit/injector.dart' as di;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/styles/colors/colors.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myCubit = di.sl<DietCubit>()..getDiet();
    return BlocProvider(
      create: (context) => myCubit,
      child: BlocConsumer<DietCubit, DietState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<DietCubit>();
          return Scaffold(
              appBar: const CustomAppBar(
                displayEditIcon: true,
              ),
              body: state is !DietDataLoading
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 17.w, vertical: 15.h),
                      child: Column(
                        children: [
                          DietItem(
                            cubit: myCubit,
                            nutritionalItems: cubit.nutritionalItems,
                            nutritionalModel: cubit.nutritionalData,
                          )
                        ],
                      ),
                    )
                  : Center(child: SpinKitCircle(color: AppColors.kGreen,)));
        },
      ),
    );
  }
}
