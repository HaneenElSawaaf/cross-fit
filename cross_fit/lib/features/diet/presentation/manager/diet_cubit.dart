import 'dart:developer';

import 'package:cross_fit/features/home/data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/shared/diet_model.dart';
import '../../data/repositories/diet_repository.dart';
import '../../utils/diet_utils.dart';

part 'diet_state.dart';

class DietCubit extends Cubit<DietState> {
  final IDietRepository dietRepository;
  final IHomeRepository homeRepository;
  DietCubit({required this.dietRepository, required this.homeRepository})
      : super(DietInitial());
  static DietCubit get(context) => BlocProvider.of(context);
  int currentDateIndex = 0;

  void changeCurrentDateIndex(int index) {
    if (currentDateIndex == index) return;
    currentDateIndex = index;
    emit(DietDateChanged());
  }

  List<DateTime> get getDates {
    final List<DateTime> dates = List.generate(
      7,
      (index) => DateTime.now().add(Duration(days: index)),
    );
    return dates;
  }

  List<DietItem> diets = [];
  List<NutritionalItem> nutritionalItems = [];
  late DietModel nutritionalData;
  void getDiet() async {
    try {
      emit(DietDataLoading());
      final response = await dietRepository.getDietData();
      response.fold((l) => log(l.toString()), (data) {
        nutritionalData = data;
        nutritionalItems.addAll([
          NutritionalItem(
            title: 'Sodium',
            value: nutritionalData.sodium,
          ),
          NutritionalItem(
            title: 'Protein',
            value: nutritionalData.proteins,
          ),
          NutritionalItem(
            title: 'Cholesterol',
            value: nutritionalData.cholesterol,
          ),
        ]);

        diets.addAll([
          DietItem(
            title: 'Breakfast',
            meals: data.breakfast!.toList(),
          ),
          DietItem(
            title: 'Launch',
            meals: data.launch!.toList(),
          ),
          DietItem(
            title: 'Dinner',
            meals: data.dinner!.toList(),
          ),
        ]);

        emit(DietDataLoaded());
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void goToDietDetailsScreen(BuildContext context, DietCubit myCubit) {
    Navigator.pushNamed(context, Routes.dietDetailsRoute, arguments: myCubit);
  }
}
