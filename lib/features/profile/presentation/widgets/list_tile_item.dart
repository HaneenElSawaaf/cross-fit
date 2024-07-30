import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_text.dart';

class ListTileItem extends StatelessWidget {
  final String title;
  final dynamic value;
  const ListTileItem({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        AppText(
          title,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        SizedBox(
          width: 70.w,
          child: AppText(
            '$value',
            fontSize: 12.sp,
            textAlign: TextAlign.end,
            maxLines: 2,
            color: Colors.grey.withOpacity(0.8),
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
