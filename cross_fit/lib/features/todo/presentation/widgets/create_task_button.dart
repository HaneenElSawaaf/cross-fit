import 'package:cross_fit/features/todo/presentation/manager/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/components/default_button.dart';
import '../../../../core/styles/colors/colors.dart';

class TodoCreateButton extends StatelessWidget {
  const TodoCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        final cubit = TodoCubit.get(context);
        return state is !TodoAddTaskLoadingState
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: DefaultButton(
                  title: 'Add Task',
                  height: 40.h,
                  onPressed: () {
                    cubit.addTask();
                  },
                ),
              )
            : SpinKitCircle(
                color: AppColors.kGreen,
              );
      },
    );
  }
}
