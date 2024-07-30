import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/icons/cross_fit_icons_icons.dart';
import 'app_text.dart';
import '../styles/colors/colors.dart';
import '../utils/assets_manager.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  final bool displayEditIcon;

  const CustomAppBar({Key? key,this.displayEditIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 8.w,
      backgroundColor: AppColors.kDarkBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        )
      ),
      leading: Padding(
        padding: EdgeInsets.only(top: 4.h,bottom: 4.h,left: 4.w),
        child: SvgPicture.asset(SvgAssets.logo),
      ),
      title: AppText('CrossFit',fontWeight: FontWeight.w700,fontSize: 20.sp,),
      actions: [
        if(displayEditIcon)
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: IconButton(
              onPressed: (){},
              icon: Icon(CrossFitIcons.edit,size: 22.sp,),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
