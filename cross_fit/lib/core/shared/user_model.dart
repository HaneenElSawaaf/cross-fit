class UserModel {
  final String uid;
  final String name;
  final String email;
  final String gender;
  final String trainingGoal;
  final int age;
  final double height;
  final double weight;
  final double percentBodyFat;
  final double muscleMass;
  final double bmi;
  final double fatMass;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.gender,
    required this.trainingGoal,
    required this.age,
    required this.height,
    required this.weight,
    required this.percentBodyFat,
    required this.muscleMass,
    required this.bmi,
    required this.fatMass,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        gender: map['gender'],
        trainingGoal: map['training_goal'],
        age: map['age'],
        height: map['height'],
        weight: map['weight'],
        percentBodyFat: map['percent_body_fat'],
        muscleMass: map['muscle_mass'],
        bmi: map['bmi'],
        fatMass: map['fat_mass']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'gender': gender,
      'training_goal': trainingGoal,
      'age': age,
      'height': height,
      'weight': weight,
      'percent_body_fat': percentBodyFat,
      'muscle_mass': muscleMass,
      'bmi': bmi,
      'fat_mass': fatMass,
    };
  }
}
