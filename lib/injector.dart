import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_fit/features/crossfit_layout/presentation/manager/cross_fit_layout_cubit.dart';
import 'package:cross_fit/features/diet/data/repositories/diet_repository.dart';
import 'package:cross_fit/features/diet/presentation/manager/diet_cubit.dart';
import 'package:cross_fit/features/home/presentation/manager/home_cubit.dart';
import 'package:cross_fit/features/login/data/repositories/login_repository.dart';
import 'package:cross_fit/features/login/presentation/manager/login_cubit.dart';
import 'package:cross_fit/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:cross_fit/features/profile/data/repositories/profile_repository.dart';
import 'package:cross_fit/features/profile/presentation/manager/profile_cubit.dart';
import 'package:cross_fit/features/register/data/repositories/register_repository.dart';
import 'package:cross_fit/features/register/presentation/manager/register_cubit.dart';
import 'package:cross_fit/features/todo/data/repositories/todo_repository.dart';
import 'package:cross_fit/features/todo/presentation/manager/todo_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/data/repositories/home_repository.dart';

final sl = GetIt.instance;

//Dependency Injection Container
Future<void> init() async {
  //TODO Cubits
  sl.registerFactory<OnBoardingCubit>(
      () => OnBoardingCubit(sharedPreferences: sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginRepository: sl()));
  sl.registerFactory<RegisterCubit>(
      () => RegisterCubit(registerRepository: sl()));
  sl.registerFactory<CrossFitLayoutCubit>(() => CrossFitLayoutCubit());
  sl.registerFactory<HomeCubit>(() => HomeCubit(homeRepository: sl()));
  sl.registerFactory<DietCubit>(
      () => DietCubit(dietRepository: sl(), homeRepository: sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(profileRepository: sl()));
  sl.registerFactory<TodoCubit>(() => TodoCubit(todoRepository: sl()));

  //TODO Repositories
  sl.registerLazySingleton<IRegisterRepository>(() =>
      RegisterRepository(FirebaseAuth.instance, FirebaseFirestore.instance));
  sl.registerLazySingleton<ILoginRepository>(
      () => LoginRepository(FirebaseAuth.instance));
  sl.registerLazySingleton<IHomeRepository>(
      () => HomeRepository(FirebaseFirestore.instance));
  sl.registerLazySingleton<IDietRepository>(
      () => DietRepository(FirebaseFirestore.instance));
  sl.registerLazySingleton<IProfileRepository>(
      () => ProfileRepository(FirebaseAuth.instance));
  sl.registerLazySingleton<ITodoRepository>(
      () => TodoRepository(FirebaseFirestore.instance));

  //TODO EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
