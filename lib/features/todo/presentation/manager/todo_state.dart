part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoAddTaskSuccessState extends TodoState {}


class TodoAddTaskLoadingState extends TodoState {}

class TodoAddTaskErrorState extends TodoState {}

class TodoGetTasksSuccessState extends TodoState {
}

class TodoGetTasksLoadingState extends TodoState {}

class TodoGetTasksErrorState extends TodoState {}

class TodoDeleteTaskSuccessState extends TodoState {}

class TodoDeleteTaskLoadingState extends TodoState {}

class TodoDeleteTaskErrorState extends TodoState {}

