import 'package:cross_fit/core/utils/sizedbox_extension.dart';
import 'package:cross_fit/features/register/utils/register_utils.dart';
import 'package:cross_fit/features/register/presentation/widgets/description_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/default_textfield.dart';
import '../../../../../core/utils/validators.dart';

class InBodyInfoView extends StatelessWidget {
  const InBodyInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const DescriptionItem(content: 'Required measurements'),
            20.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Form(
                key: RegisterForms.registerBodyInfoForm,
                child: Column(children: [
                  DefaultTextField(
                    inputType: TextInputType.number,
                    title: 'Age',
                    maxLength: 2,
                    controller: RegisterTextControllers.ageController,
                    validator: Validators.ageValidator,
                  ),
                  DefaultTextField(
                    inputType: TextInputType.number,
                    title: 'Weight',
                    suffixText: 'kg',
                    maxLength: 3,
                    controller: RegisterTextControllers.weightController,
                    validator: Validators.weightValidator,
                  ),
                  DefaultTextField(
                    inputType: TextInputType.number,
                    suffixText: 'cm',
                    title: 'Height',
                    maxLength: 3,
                    controller: RegisterTextControllers.heightController,
                    validator: Validators.heightValidator,
                  ),
                  DefaultTextField(
                    inputType: TextInputType.number,
                    title: 'Percent body fat',
                    suffixText: '%',
                    maxLength: 3,
                    controller: RegisterTextControllers.percentBodyFatController,
                    validator: Validators.percentBodyValidator,
                  ),
                  DefaultTextField(
                    inputType: TextInputType.number,
                    title: 'Muscle mass',
                    suffixText: 'kg',
                    maxLength: 3,
                    controller: RegisterTextControllers.muscleMassController,
                    validator: Validators.muscleMassValidator,
                  ),
                  DefaultTextField(
                    inputType: TextInputType.number,
                    title: 'Fat mass',
                    suffixText: 'kg',
                    maxLength: 3,
                    controller: RegisterTextControllers.fatMassController,
                    validator: Validators.fatMassValidator,
                  ),
                  DefaultTextField(
                    inputType: TextInputType.number,
                    title: 'BMI',
                    suffixText: 'kg/m2',
                    maxLength: 3,
                    controller: RegisterTextControllers.bmiController,
                    validator: Validators.bmiValidator,
                  ),
                  30.heightSpace,
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
