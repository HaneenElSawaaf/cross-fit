import 'dart:developer';

import 'package:cross_fit/core/errors/firebase_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:cross_fit/injector.dart' as di;

import '../../../../core/components/toast_message.dart';
import '../../../../core/routes/app_router.dart';
import '../../../register/presentation/manager/register_cubit.dart';
import '../../data/repositories/login_repository.dart';
import 'login_utils.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ILoginRepository loginRepository;
  LoginCubit({required this.loginRepository}) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final RoundedLoadingButtonController loginBtnController =
      RoundedLoadingButtonController();

  void login(BuildContext context) async {
    if (LoginForms.validateLoginForm()) {
        loginBtnController.start();
        final response = await loginRepository.loginWithEmailAndPassword(
            email: LoginTextController.emailController.text,
            password: LoginTextController.passwordController.text);
        response.fold(
          (error) {
            loginBtnController.error();
            showToast(error.errorMessage());
            resetLoginBtn();
          },
          (success) {
            loginBtnController.success();
             Future.delayed(const Duration(milliseconds: 500),
            () => Navigator.pushNamedAndRemoveUntil(
                context, Routes.layoutRoute, (route) => false));
          },
        );
      
    } else {
      loginBtnController.error();
      resetLoginBtn();
    }
  }

  Future<void> resetLoginBtn() => Future.delayed(
        const Duration(milliseconds: 500),
        () {
          loginBtnController.reset();
        },
      );

  void navigateToRegister(context) {
    final registerCubit = di.sl<RegisterCubit>();
    Navigator.pushNamed(context, Routes.registerRoute,
        arguments: registerCubit);
  }
}
