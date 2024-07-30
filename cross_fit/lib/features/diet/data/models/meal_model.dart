class MealModel
{
  final double calories;
  final double fat;
  final double protein;
  final String image;
  final String title;

  MealModel({
    required this.calories,
    required this.fat,
    required this.protein,
    required this.image,
    required this.title
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      calories: json['calories'],
      fat: json['fat'],
      protein: json['protein'],
      image: json['image'],
      title: json['title']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'fat': fat,
      'protein': protein,
      'image': image,
      'title':title
    };
  }
}