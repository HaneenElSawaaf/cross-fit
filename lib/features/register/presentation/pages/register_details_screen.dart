import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/register/presentation/manager/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/components/default_button.dart';
import '../../../../core/styles/colors/colors.dart';
import '../widgets/custom_stepper.dart';

class RegisterDetailsScreen extends StatelessWidget {
  const RegisterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = RegisterCubit.get(context);
        final lastPage = cubit.registerDetailsViews.length - 1;
        final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
        return LoaderOverlay(
            useDefaultLoading: false,
            overlayOpacity: 0.3,
            overlayWidget: Center(
              child: SpinKitCircle(
                color: AppColors.kGreen,
                size: 45.sp,
              ),
            ),
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 35.h, right: 32.w, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: IconButton(
                                  onPressed: () {
                                    if (cubit.currentPage == 0) {
                                      Navigator.pop(context);
                                    } else {
                                      cubit.previousPage();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.white,
                                    size: 30.sp,
                                  )),
                            ),
                            10.widthSpace,
                            const CustomStepper(),
                          ],
                        )),
                    Expanded(
                        child: PageView.builder(
                      controller: cubit.pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.registerDetailsViews.length,
                      onPageChanged: (index) {
                        cubit.changePage(index);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return cubit.registerDetailsViews[index];
                      },
                    ))
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
                  child: showFab
                      ? DefaultButton(
                          title:
                              cubit.currentPage == lastPage ? 'Save' : 'Next',
                          height: 35.h,
                          onPressed: () {
                            RegisterCubit.get(context).nextPage(context);
                          },
                        )
                      : null,
                ),
              ),
            ));
      },
    );
  }
}
