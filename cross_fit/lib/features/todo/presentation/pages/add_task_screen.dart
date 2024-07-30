import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/core/utils/validators.dart';
import 'package:cross_fit/features/todo/presentation/manager/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/default_textfield.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/create_task_button.dart';
import '../../utils/todo_utils.dart';
import '../widgets/todo_app_bar.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        if(state is TodoGetTasksSuccessState){
          Navigator.pop(context);
        }
      },
      buildWhen: (previous, current) => current is TodoInitial,
      builder: (context, state) {
        final cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: const TodoAppBar(
            title: AppStrings.addNewTask,
            isAddButtonVisible: false,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: TodoForms.addTaskForm,
                child: Column(
                  children: [
                    DefaultTextField(
                      inputType: TextInputType.text,
                      title: 'Task Name',
                      controller: TodoTextController.taskNameController,
                      validator: Validators.taskDateValidator,
                    ),
                    15.heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: DefaultTextField(
                            inputType: TextInputType.text,
                            title: 'Date',
                            readOnly: true,
                            controller: TodoTextController.taskDateController,
                            validator: Validators.taskDateValidator,
                            onTap: () {
                              cubit.pickDate(context);
                            },
                          ),
                        ),
                        10.widthSpace,
                        Expanded(
                          child: DefaultTextField(
                            inputType: TextInputType.text,
                            title: 'Time',
                            readOnly: true,
                            controller: TodoTextController.taskTimeController,
                            validator: Validators.taskTimeValidator,
                            onTap: () {
                              cubit.pickTime(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    15.heightSpace,
                   DefaultTextField(
                      inputType: TextInputType.multiline,
                      title: 'Description',
                      controller: TodoTextController.taskDescriptionController,
                      validator: Validators.taskDescriptionValidator,
                    ),
                    25.heightSpace,
                    const TodoCreateButton()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
