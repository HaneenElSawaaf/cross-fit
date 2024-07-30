import 'package:cross_fit/features/crossfit_layout/presentation/manager/cross_fit_layout_cubit.dart';
import 'package:cross_fit/features/crossfit_layout/presentation/pages/crossfit_layout.dart';
import 'package:cross_fit/features/diet/presentation/pages/diet_details_screen.dart';
import 'package:cross_fit/features/diet/presentation/pages/meal_screen.dart';
import 'package:cross_fit/features/login/presentation/manager/login_cubit.dart';
import 'package:cross_fit/features/login/presentation/pages/login_screen.dart';
import 'package:cross_fit/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:cross_fit/features/register/presentation/pages/page_views/loading_view.dart';
import 'package:cross_fit/features/register/presentation/pages/register_details_screen.dart';
import 'package:cross_fit/features/register/presentation/pages/register_screen.dart';
import 'package:cross_fit/features/todo/presentation/manager/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cross_fit/injector.dart' as di;
import '../../features/diet/presentation/manager/diet_cubit.dart';
import '../../features/diet/utils/meal_utils.dart';
import '../../features/onboarding/presentation/manager/onboarding_cubit.dart';
import '../../features/register/presentation/manager/register_cubit.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/todo/presentation/pages/add_task_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String registerDetailsRoute = '/register_details';
  static const String loadingHomeRoute = '/loading_home';
  static const String onBoardingRoute = '/onboarding';
  static const String layoutRoute = '/layout';
  static const String workoutRoute = '/workout';
  static const String dietDetailsRoute = '/diet_details';
  static const String mealRoute = '/meal';
  static const String addTaskRoute = '/add_task';
}

//TODO chain of responsibility COR
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case Routes.onBoardingRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 1000),
          child: BlocProvider(
            create: (context) => di.sl<OnBoardingCubit>(),
            child: const OnBoardingScreen(),
          ),
        );
      case Routes.loginRoute:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
          child: BlocProvider(
            create: (context) => di.sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerRoute:
        final registerCubit = routeSettings.arguments as RegisterCubit;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
          child: BlocProvider(
            create: (context) => registerCubit,
            child: RegisterScreen(
              registerCubit: registerCubit,
            ),
          ),
        );
      case Routes.registerDetailsRoute:
        final registerCubit = routeSettings.arguments as RegisterCubit;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
          child: BlocProvider.value(
            value: registerCubit,
            child: const RegisterDetailsScreen(),
          ),
        );
      case Routes.layoutRoute:
        return PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          duration: const Duration(milliseconds: 800),
          child: BlocProvider(
            create: (context) => di.sl<CrossFitLayoutCubit>()..getUserData(),
            child: const CrossFitLayout(),
          ),
        );
      case Routes.loadingHomeRoute:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 800),
          child: const LoadingDietScreen(),
        );
      case Routes.dietDetailsRoute:
        final dietCubit = routeSettings.arguments as DietCubit;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: BlocProvider.value(
            value: dietCubit,
            child: const DietDetailsScreen(),
          ),
        );
      case Routes.addTaskRoute:
        final todoCubit = routeSettings.arguments as TodoCubit;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: BlocProvider.value(
            value: todoCubit,
            child: const AddTaskScreen(),
          ),
        );
      case Routes.mealRoute:
        final mealModel = routeSettings.arguments as MealScreenArguments;
        return MaterialPageRoute(
            builder: ((context) => MealScreen(
                  mealModel: mealModel.mealModel,
                  dietModel: mealModel.dietModel,
                )));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('Undefined Route'),
            ),
          )),
    );
  }
}
