import 'dart:developer';

import 'package:cross_fit/core/components/toast_message.dart';
import 'package:cross_fit/features/todo/data/models/task_model.dart';
import 'package:cross_fit/features/todo/data/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../utils/todo_utils.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final ITodoRepository todoRepository;
  TodoCubit({required this.todoRepository}) : super(TodoInitial());

  static TodoCubit get(context) => BlocProvider.of(context);

  DateTime? date;
  TimeOfDay? time;
  void pickDate(BuildContext context) async {
    date = await TodoPicker.showDate(context);
    if (date != null) {
      TodoTextController.taskDateController.text =
          DateFormat.yMMMd().format(date!);
    }
  }

  void pickTime(BuildContext context) async {
    time = await TodoPicker.showTime(context);
    if (time != null) {
      // ignore: use_build_context_synchronously
      TodoTextController.taskTimeController.text = time!.format(context);
    }
  }

  List<TaskModel> tasks = [];

  Future<void> getTasks() async {
    emit(TodoGetTasksLoadingState());
    final response = await todoRepository.getTasks();
    response.fold((l) {
      log(l.toString());
      emit(TodoGetTasksErrorState());
    }, (tasks) {
      this.tasks = tasks;
      emit(TodoGetTasksSuccessState());
    });
  }

  void addTask() async {
    try {
      if (TodoForms.validateAddTaskForm()) {
        final taskDate = DateTime(
            date!.year, date!.month, date!.day, time!.hour, time!.minute);
        emit(TodoAddTaskLoadingState());
        TaskModel model = TaskModel(
            title: TodoTextController.taskNameController.text,
            taskDate: taskDate,
            description: TodoTextController.taskDescriptionController.text);
        final response = await todoRepository.createTask(model);
        response.fold((l) {
          log(l.toString());
          emit(TodoAddTaskErrorState());
        }, (r) async {
          showToast('Task Added Successfully');
          TodoTextController.clearAddTaskForm();
          emit(TodoAddTaskSuccessState());
          getTasks();
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void deleteTask(String taskId, int taskIndex) async {
    tasks.removeAt(taskIndex);
    emit(TodoDeleteTaskLoadingState());
    final response = await todoRepository.deleteTask(taskId);
    response.fold((l) {
      log(l.toString());
      emit(TodoDeleteTaskErrorState());
    }, (r) async {
      showToast('Task Deleted Successfully');
      emit(TodoDeleteTaskSuccessState());
    });
  }
}
