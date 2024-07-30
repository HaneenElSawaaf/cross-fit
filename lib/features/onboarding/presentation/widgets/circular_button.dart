import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/colors.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const CircularButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 35.h,
      onPressed: onPressed,
      color: AppColors.kGreen,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
