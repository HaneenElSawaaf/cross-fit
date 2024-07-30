import 'dart:convert';
import 'package:cross_fit/features/diet/presentation/pages/diet_screen.dart';
import 'package:cross_fit/features/profile/presentation/pages/profile_screen.dart';
import 'package:cross_fit/features/todo/presentation/pages/todo_screen.dart';
import 'package:cross_fit/features/workout/presentation/pages/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/shared/user_model.dart';
import '../../../../core/shared/user_utils.dart';
import '../../../home/presentation/pages/home_screen.dart';
import 'package:cross_fit/injector.dart' as di;

part 'cross_fit_layout_state.dart';

class CrossFitLayoutCubit extends Cubit<CrossFitLayoutState> {
  CrossFitLayoutCubit() : super(CrossFitLayoutInitial());

  static CrossFitLayoutCubit get(context) => BlocProvider.of(context);
  int currentPage = 0;
  void changeIndex(int index) {
    currentPage = index;
    emit(ChangeIndex());
  }

  void getUserData() async {
    final sharedPref = di.sl<SharedPreferences>();
    final cachedData = sharedPref.getString('userModel');
    if(cachedData!=null){
    UserUtils.currentUser = UserModel.fromMap(jsonDecode(cachedData));
    }
  }

  List<Widget> screens = const [
    HomeScreen(),
    WorkoutScreen(),
    DietScreen(),
    ProfileScreen(),
    TodoScreen(),
  ];
}
