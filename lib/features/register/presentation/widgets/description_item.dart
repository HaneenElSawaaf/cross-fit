import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/app_text.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

class DescriptionItem extends StatelessWidget {
  final String content;
  const DescriptionItem({Key? key,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SvgPicture.asset(
            SvgAssets.logo,
            width: 35.w,
            height: 35.h,
          ),
          10.widthSpace,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  AppStrings.appName,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
                Text(content,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
