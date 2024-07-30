import 'package:cross_fit/core/components/app_text.dart';
import 'package:cross_fit/core/components/default_progress_button.dart';
import 'package:cross_fit/core/components/default_text_button.dart';
import 'package:cross_fit/core/components/default_textfield.dart';
import 'package:cross_fit/core/utils/assets_manager.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/register/presentation/manager/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/validators.dart';
import '../../utils/register_utils.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterCubit registerCubit;
  const RegisterScreen({Key? key, required this.registerCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = RegisterCubit.get(context);
        return Scaffold(
            body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      SvgAssets.logo,
                      width: 70.w,
                      height: 70.h,
                    ),
                    20.heightSpace,
                    AppText(
                      'Sign up',
                      color: AppColors.kGreen,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    60.heightSpace,
                    Form(
                      key: RegisterForms.registerAuthForm,
                      child: Column(
                        children: [
                          DefaultTextField(
                            inputType: TextInputType.text,
                            controller: RegisterTextControllers.nameController,
                            title: 'Enter your name',
                            validator: Validators.nameValidator,
                          ),
                          DefaultTextField(
                            inputType: TextInputType.emailAddress,
                            title: 'Enter your email',
                            controller: RegisterTextControllers.emailController,
                            validator: Validators.emailValidator,
                          ),
                          DefaultTextField(
                            inputType: TextInputType.visiblePassword,
                            secure: true,
                            title: 'Password',
                            controller:
                                RegisterTextControllers.passwordController,
                            validator:
                                Validators.passwordValidator,
                          ),
                          DefaultTextField(
                            inputType: TextInputType.visiblePassword,
                            secure: true,
                            title: 'Confirm Password',
                            controller:
                                RegisterTextControllers.confirmPasswordController,
                            validator: Validators.confirmPasswordValidator,
                          ),
                        ]
                            .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: e))
                            .toList(),
                      ),
                    ),
                    10.heightSpace,
                    DefaultProgressButton(
                        title: 'Sign up',
                        onPressed: () {
                          cubit.navigateToRegisterDetails(
                              context: context, registerCubit: registerCubit);
                        },
                        controller: cubit.registerBtnController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          'Already have an account?',
                          color: AppColors.kGrey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        DefaultTextButton(
                          title: 'Sign in',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          splashColor: AppColors.kGreen.withOpacity(0.2),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
