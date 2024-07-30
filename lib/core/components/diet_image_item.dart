import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_fit/core/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DietImageItem extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  const DietImageItem(
      {Key? key, required this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
          height: height ?? 50.h,
          width: width ?? 80.w,
          fit: BoxFit.cover,
          placeholder: (context, url) => SpinKitWanderingCubes(
                color: AppColors.kGreen,
                size: 20.sp,
              ),
          imageUrl:
              imageUrl),
    );
  }
}
