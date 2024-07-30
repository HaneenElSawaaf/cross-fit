import 'package:flutter/material.dart';

class LoginTextController
{
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
}

class LoginForms
{
  static final loginForm = GlobalKey<FormState>();

  static bool validateLoginForm()
  {
    return loginForm.currentState!.validate();
  }
}