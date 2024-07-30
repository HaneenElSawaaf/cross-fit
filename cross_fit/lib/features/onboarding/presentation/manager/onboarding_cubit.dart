import 'package:cross_fit/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/local/caching_keys.dart';
import '../../utils/onboarding_model.dart';
part 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final SharedPreferences sharedPreferences;

  OnBoardingCubit({required this.sharedPreferences})
      : super(OnBoardingInitialState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  List<BoardingModel> boarding = [
    BoardingModel(
        image: ImgAssets.diet,
        title: 'Suitable Diet',
        body:
            'Lorem ipsum dolor sit amet consectetur. Amet consectetur odio fermentum vitae. Nulla eget mattis in est pulvinar felis.'),
    BoardingModel(
        image: ImgAssets.workout,
        title: 'Suitable Workout',
        body:
            'Lorem ipsum dolor sit amet consectetur. Amet consectetur odio fermentum vitae. Nulla eget mattis in est pulvinar felis.'),
    BoardingModel(
        image: ImgAssets.activity,
        title: 'Summary of your activities',
        body:
            'Lorem ipsum dolor sit amet consectetur. Amet consectetur odio fermentum vitae. Nulla eget mattis in est pulvinar felis.'),
  ];

  final boardController = PageController();
  int currentIndex = 0;

  get isLast => currentIndex == boarding.length - 1;

  void navigateToLogin(context) {
    sharedPreferences.setBool(CachingKeys.finishBoarding, true);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginRoute, (route) => false);
  }

  void changeIndex(context) {
    if (isLast) {
      navigateToLogin(context);
    } else {
      boardController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void indexListener(index) {
    debugPrint(index.toString());
    currentIndex = index;
    if (isLast) {
      emit(OnBoardingLastState());
    } else {
      emit(OnBoardingInitialState());
    }
  }
}
