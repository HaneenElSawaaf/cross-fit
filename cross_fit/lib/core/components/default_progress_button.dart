import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class DefaultProgressButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final RoundedLoadingButtonController controller;
  const DefaultProgressButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      color: Theme.of(context).primaryColor,
      errorColor: Colors.red.shade300,
      controller: controller,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
