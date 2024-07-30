import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension EmptySpace on num {
  SizedBox get heightSpace => SizedBox(height: toDouble().h,);
  SizedBox get widthSpace => SizedBox(width: toDouble().w,);
}