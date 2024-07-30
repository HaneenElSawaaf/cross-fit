import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/styles/colors/colors.dart';

class AvatarItem extends StatelessWidget {
  final String imageUrl;
  const AvatarItem({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context,url) => SizedBox(
        width: 110.w,
        height: 110.h,
        child: Center(
          child: SpinKitWanderingCubes(
            color: AppColors.kGreen,
            size: 20.sp,
          ),
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: 120.w,
        height: 120.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 5,
            )
          ],
          border: Border.all(
            color: Colors.white,
            width: 2
          ),
          image: DecorationImage(
              image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
