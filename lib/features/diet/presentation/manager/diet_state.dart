part of 'diet_cubit.dart';

abstract class DietState {}

class DietInitial extends DietState {}

class DietDateChanged extends DietState {}

class DietDataLoading extends DietState {}

class DietDataLoaded extends DietState {}

class DietDataError extends DietState {}
