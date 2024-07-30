import 'package:cross_fit/core/components/app_text.dart';
import 'package:cross_fit/core/components/default_text_button.dart';
import 'package:cross_fit/core/components/default_textfield.dart';
import 'package:cross_fit/core/utils/assets_manager.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/login/presentation/manager/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/components/default_progress_button.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/validators.dart';
import '../manager/login_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return Scaffold(
            body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SvgAssets.logo,
                    width: 70.w,
                    height: 70.h,
                  ),
                  20.heightSpace,
                  AppText(
                    'Sign in',
                    color: AppColors.kGreen,
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  60.heightSpace,
                  Form(
                    key: LoginForms.loginForm,
                    child: Column(
                      children: [
                        DefaultTextField(
                          inputType: TextInputType.emailAddress,
                          title: 'Email',
                          controller: LoginTextController.emailController,
                          validator: Validators.emailValidator,
                        ),
                        10.heightSpace,
                        DefaultTextField(
                          inputType: TextInputType.visiblePassword,
                          secure: true,
                          title: 'Password',
                          controller: LoginTextController.passwordController,
                          validator: Validators.passwordValidator,
                        ),
                      ],
                    ),
                  ),
                  10.heightSpace,
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 7.w),
                        child: AppText(
                          'Forgot Password?',
                          color: AppColors.kGrey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 12.h),
                    child: DefaultProgressButton(
                      title: 'Sign in',
                      onPressed: () {
                        cubit.login(context);
                      },
                      controller: cubit.loginBtnController,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        'Don\'t have an account?',
                        color: AppColors.kGrey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      DefaultTextButton(
                        title: 'Sign up',
                        onPressed: () {
                          cubit.navigateToRegister(context);
                        },
                        splashColor: AppColors.kGreen.withOpacity(0.2),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
