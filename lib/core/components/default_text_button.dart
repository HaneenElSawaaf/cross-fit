import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DefaultTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final Color? foregroundColor;
  final Color? splashColor;
  const DefaultTextButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontSize = 15.0,
      this.foregroundColor,
      this.splashColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => splashColor??Colors.grey.withOpacity(0.2)),
      ),
      child: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: foregroundColor ?? Theme.of(context).primaryColor,
            fontSize: fontSize.sp,
          )),
    );
  }
}
