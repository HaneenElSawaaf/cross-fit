import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? fontSize;
  const DefaultButton(
      {Key? key, required this.onPressed, required this.title, this.height,this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30.h,
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize??20.sp,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
