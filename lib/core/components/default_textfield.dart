import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors/colors.dart';

class DefaultTextField extends StatelessWidget {
  final String? title;
  final bool secure;
  final TextInputType inputType;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final String? label;
  final ValueChanged<String>? onSubmitted;
  final Color? fillColor;
  final IconData? prefix;
  final bool readOnly;
  final bool filled;
  final int? maxLength;
  final TextAlign? textAlign;
  final num height;
  final num width;
  final GestureTapCallback? onTap;
  final String? suffixText;
  const DefaultTextField({
    Key? key,
    this.title,
    this.secure = false,
    required this.inputType,
    this.onTap,
    this.controller,
    this.validator,
    this.label,
    this.onSubmitted,
    this.fillColor,
    this.prefix,
    this.maxLength,
    this.filled = true,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.height = 10,
    this.width = 10,
    this.suffixText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLabel = label != null;
    return TextFormField(
      controller: controller,
      obscureText: secure,
      onTap: onTap,
      keyboardType: inputType,
      validator: validator,
      maxLength: maxLength,
      readOnly: readOnly,
      textAlign: textAlign!,
      maxLines: inputType == TextInputType.multiline ? 7 : 1,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(

        contentPadding:
        EdgeInsets.symmetric(vertical: height.h, horizontal: width.w),
        isDense: true,
        filled: filled,
        suffixText: suffixText,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        fillColor: fillColor??AppColors.kDarkBlack,
        hintText: title,
        label: isLabel ? Text(label!) : null,
        labelStyle: isLabel ? const TextStyle(color: Colors.black) : null,
        hintStyle: TextStyle(color: AppColors.kGrey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),

            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.kGreen),
        ),
      ),
    );
  }
}
