import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../data/models/task_model.dart';
import '../manager/todo_cubit.dart';

class TodoContainer extends StatelessWidget {
  final TaskModel taskModel;
  final int index;
  const TodoContainer(this.index, {super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    final cubit = TodoCubit.get(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: AppColors.kDarkBlack, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: AppColors.kGreen, shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(1.sp),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                title: AppText(
                  taskModel.title,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
                trailing: IconButton(
                  onPressed: () {
                    cubit.deleteTask(taskModel.id!, index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.kGrey,
                  ),
                )),
            AppText(
              taskModel.description,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
            5.heightSpace,
            Padding(
              padding: EdgeInsets.only(bottom: 5.0.h),
              child: AppText(
                DateFormat('h:mm a, EEE d MMM, y').format(taskModel.taskDate),
                color: AppColors.kGrey,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
