part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class DataLoading extends HomeState {}

class DataLoaded extends HomeState {
  final DietModel nutritionalModel;
  final List<MealModel> mealModel;
  DataLoaded({required this.nutritionalModel, required this.mealModel});
}

class DataError extends HomeState {}
