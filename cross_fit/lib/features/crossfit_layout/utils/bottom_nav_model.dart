import 'package:flutter/material.dart';

import '../../../core/styles/icons/cross_fit_icons_icons.dart';

class BottomNavItem {
  final String title;
  final IconData icon;

  BottomNavItem({
    required this.title,
    required this.icon,
  });
}

List<BottomNavItem> bottomNavItems = [
  BottomNavItem(
    title: 'Home',
    icon: CrossFitIcons.home,
  ),
  BottomNavItem(
    title: 'Workout',
    icon: CrossFitIcons.workout,
  ),
  BottomNavItem(
    title: 'Meal',
    icon: CrossFitIcons.meal,
  ),
  BottomNavItem(
    title: 'Profile',
    icon: CrossFitIcons.profile,
  ),
];

