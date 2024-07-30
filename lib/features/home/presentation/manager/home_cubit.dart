import 'dart:developer';

import 'package:cross_fit/features/home/data/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../diet/data/models/meal_model.dart';
import '../../../../core/shared/diet_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  late DietModel nutritionalData;
  void getHomeData() async {
    if (isClosed) return;
    emit(DataLoading());
    try {
      final response = await homeRepository.getDietData();
      response.fold((error) {
        emit(DataError());
      }, (data) {
        nutritionalData = data;
        emit(DataLoaded(
            nutritionalModel: nutritionalData, mealModel: data.breakfast!));
      });
    } catch (e) {
      log(e.toString());
      emit(DataError());
    }
  }
}
