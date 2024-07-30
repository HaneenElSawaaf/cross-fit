import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../manager/todo_cubit.dart';
import '../widgets/todo_app_bar.dart';
import '../widgets/todo_container.dart';
import 'package:cross_fit/injector.dart' as di;

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoCubit = di.sl<TodoCubit>();
    return BlocProvider(
        create: (context) => todoCubit..getTasks(),
        child: Scaffold(
            appBar: TodoAppBar(
              title: AppStrings.todoList,
              isAddButtonVisible: true,
              todoCubit: todoCubit,
            ),
            body: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                final cubit = TodoCubit.get(context);
                return state is! TodoGetTasksLoadingState &&
                        state is! TodoGetTasksLoadingState
                    ? cubit.tasks.isNotEmpty
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        TodoContainer(
                                          index,
                                          taskModel: cubit.tasks[index],
                                        ),
                                    separatorBuilder: (context, index) =>
                                        10.heightSpace,
                                    itemCount: cubit.tasks.length),
                                10.heightSpace,
                              ],
                            ),
                          )
                        : Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 35.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  LottieAssets.emptyTodoList,
                                  width: 300.w,
                                  height: 300.h,
                                  repeat: false,
                                ),
                                Text(
                                  'Your Todo is empty',
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.withOpacity(0.8)
                                      ),
                                )
                              ],
                            ),
                          ),
                        )
                    : SpinKitCircle(
                        color: AppColors.kGreen,
                      );
              },
            )));
  }
}
