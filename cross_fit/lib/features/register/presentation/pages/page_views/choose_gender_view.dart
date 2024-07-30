import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/register/presentation/widgets/gender_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/gender_model.dart';
import '../../widgets/description_item.dart';

class ChooseGenderView extends StatelessWidget {
  const ChooseGenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
      child: Column(
        children: [
          const DescriptionItem(content: 'Select your gender',),
          50.heightSpace,
          Row(
              children: List.generate(genders.length, (index) {
            return GenderItem(
              title: genders[index].title,
              image: genders[index].image,
              index: index,
            );
          })),
        ],
      ),
    );
  }
}
