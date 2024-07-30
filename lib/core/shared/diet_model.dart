import '../../features/diet/data/models/meal_model.dart';

class DietModel {
  final double calories;
  final double cholesterol;
  final double proteins;
  final double sodium;
  final double weightLoss;
  final List<MealModel>? breakfast;
  final List<MealModel>? launch;
  final List<MealModel>? dinner;

  DietModel({
    required this.calories,
    required this.cholesterol,
    required this.proteins,
    required this.sodium,
    required this.weightLoss,
    this.breakfast,
    this.launch,
    this.dinner,
  });

  factory DietModel.fromJson(Map<String, dynamic> json) {
    return DietModel(
      calories: json['calories'],
      cholesterol: json['cholesterol'],
      proteins: json['proteins'],
      sodium: json['sodium'],
      weightLoss: json['weight_loss'],
      breakfast: List<MealModel>.from(
          json['meals']['breakfast'].map((x) => MealModel.fromJson(x))),
      launch: List<MealModel>.from(
          json['meals']['launch'].map((x) => MealModel.fromJson(x))),
      dinner: List<MealModel>.from(
          json['meals']['dinner'].map((x) => MealModel.fromJson(x))),
    );
  }
}
