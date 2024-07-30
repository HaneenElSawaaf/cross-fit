import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/routes/app_router.dart';
import '../manager/todo_cubit.dart';

class TodoAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isAddButtonVisible;
  final TodoCubit? todoCubit;
  const TodoAppBar(
      {super.key,
      required this.title,
      required this.isAddButtonVisible,
      this.todoCubit});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      title: AppText(
        title,
        fontSize: 30.sp,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      actions: [
        if (isAddButtonVisible) ...{
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.addTaskRoute,
                  arguments: todoCubit);
            },
            icon: Icon(
              Icons.add,
              size: 35.sp,
            ),
          ),
          7.widthSpace,
        }
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
