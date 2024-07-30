import 'package:flutter/material.dart';

import '../../../core/styles/colors/colors.dart';

class TodoForms {
  static final addTaskForm = GlobalKey<FormState>();

  static bool validateAddTaskForm() {
    return addTaskForm.currentState!.validate();
  }
}

class TodoTextController {
  static final taskNameController = TextEditingController();
  static final taskDateController = TextEditingController();
  static final taskTimeController = TextEditingController();
  static final taskDescriptionController = TextEditingController();

  static void clearAddTaskForm() {
    taskNameController.clear();
    taskDateController.clear();
    taskTimeController.clear();
    taskDescriptionController.clear();
  }
}

class TodoPicker {
  static Future<DateTime?> showDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 730),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.kGreen,
              onSurface: Colors.white,
              onPrimary: AppColors.kDarkBlack,
              surface: AppColors.kDarkBlack,
            ),
            // button colors
          ),
          child: child!,
        );
      },
    );
  }

  static Future<TimeOfDay?> showTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.kGreen,
              onSurface: Colors.white,
              surface: AppColors.kDarkBlack,
            ),
            // button colors
          ),
          child: child!,
        );
      },
    );
  }
}
