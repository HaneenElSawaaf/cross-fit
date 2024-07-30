import 'package:cross_fit/core/styles/icons/cross_fit_icons_icons.dart';
import 'package:flutter/material.dart';

class GoalModel {
  final String title;
  final IconData icon;
  final String description;

  GoalModel({
    required this.title,
    required this.icon,
    required this.description,
  });
}

List<GoalModel> goals = [
  GoalModel(
      title: 'Muscle building',
      icon: CrossFitIcons.workout,
      description:
          'Building muscles exercises help you to lose fat and increase the muscular density which helps you to stay in shape'),
  GoalModel(
      title: 'Gain strenth',
      icon: CrossFitIcons.strength,
      description:
          'The exercises that increase muscular strength help you to lift heavier weights, which helps you to boost your fitness '
  ),
  GoalModel(
      title: 'Endurance',
      icon: CrossFitIcons.endurance,
      description:
      'Muscular endurance exercises help to raise the heartbreat rate through aerobic exercises and resistance exercises which help to increase'),
];
