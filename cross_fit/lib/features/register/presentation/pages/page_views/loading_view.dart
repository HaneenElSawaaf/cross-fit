import 'package:cross_fit/core/components/app_text.dart';
import 'package:cross_fit/core/components/default_button.dart';
import 'package:cross_fit/core/utils/assets_manager.dart';
import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/register/presentation/widgets/description_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/routes/app_router.dart';

class LoadingDietScreen extends StatelessWidget {
  const LoadingDietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            100.heightSpace,
            const DescriptionItem(content: 'Your personal Info'),
            50.heightSpace,
            Lottie.asset(LottieAssets.confirmRegister,
                width: 200.w, height: 200.h),
            // GradientCircularProgressIndicator(
            //   gradient: LinearGradient(
            //     colors: [HexColor('#00C853'), HexColor('#69F0AE')],
            //   ),
            //   radius: 100.sp,
            //   value: 0.7,
            // ),
            35.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const AppText(
                'Your data is being analyzed to design your program',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            ),
            35.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: DefaultButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.layoutRoute, (route) => false);
                },
                title: 'Start',
                height: 38.h,
                fontSize: 25.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
