import '../data/models/meal_model.dart';

class NutritionalItem
{
  final String title;
  final double value;
  NutritionalItem({required this.title,required this.value});
}

class DietItem {
  final String title;
  final List<MealModel> meals;
  DietItem({required this.title, required this.meals});
}