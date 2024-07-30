import 'package:flutter/material.dart';

class RegisterForms {
  static final registerAuthForm = GlobalKey<FormState>();
  static final registerBodyInfoForm = GlobalKey<FormState>();

  static bool validateRegisterForm() {
    return registerAuthForm.currentState!.validate();
  }

  static bool validateRegisterDetailsForm() {
    return registerBodyInfoForm.currentState!.validate();
  }
}

List<String> trainingGoals = ['Muscle Building', 'Gain Strength', 'Endurance'];

class RegisterTextControllers {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final confirmPasswordController = TextEditingController();
  static final nameController = TextEditingController();
  static final weightController = TextEditingController();
  static final heightController = TextEditingController();
  static final ageController = TextEditingController();
  static final percentBodyFatController = TextEditingController();
  static final muscleMassController = TextEditingController();
  static final fatMassController = TextEditingController();
  static final bmiController = TextEditingController();
}