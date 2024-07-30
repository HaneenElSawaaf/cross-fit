import '../../features/register/utils/register_utils.dart';

class Validators {
  static String? emailValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email';
    } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value) ==
        false) {
      return 'Please enter a valid email';
    } else {
      return null;
    }
  }

  static String? passwordValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    } else if (value != RegisterTextControllers.passwordController.text) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  static String? nameValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  static String? weightValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your weight';
    } else {
      return null;
    }
  }

  static String? heightValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your height';
    } else {
      return null;
    }
  }

  static String? ageValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your age';
    } else {
      return null;
    }
  }

  static String? percentBodyValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your percent body fat';
    } else {
      return null;
    }
  }

  static String? muscleMassValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your muscle mass';
    } else {
      return null;
    }
  }

  static String? fatMassValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your fat mass';
    } else {
      return null;
    }
  }

  static String? bmiValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter your bmi';
    } else {
      return null;
    }
  }

  static String? taskNameValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter task name';
    } else {
      return null;
    }
  }

  static String? taskDateValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter task date';
    } else {
      return null;
    }
  }

  static String? taskTimeValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter task time';
    } else {
      return null;
    }
  }

  static String? taskDescriptionValidator(dynamic value) {
    if (value!.isEmpty) {
      return 'Please enter task description';
    } else {
      return null;
    }
  }
}
