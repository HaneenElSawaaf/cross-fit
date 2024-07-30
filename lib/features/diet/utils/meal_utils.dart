import '../../../core/shared/diet_model.dart';
import '../data/models/meal_model.dart';

class MealQuantity {
  final double value;
  final double dividerValue;
  final String title;
  MealQuantity(
      {required this.value, required this.title, required this.dividerValue});
}

class MealScreenArguments {
  final MealModel mealModel;
  final DietModel dietModel;

  MealScreenArguments({required this.mealModel, required this.dietModel});
}
