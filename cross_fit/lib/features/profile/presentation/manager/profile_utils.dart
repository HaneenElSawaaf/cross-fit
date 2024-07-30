import '../../../../core/shared/user_utils.dart';

class ProfileData {
  final String title;
  final dynamic value;
  ProfileData({required this.title, required this.value});
}

List<ProfileData> get profileDataList {
  return [
    ProfileData(title: 'Name', value: UserUtils.currentUser!.name),
    ProfileData(title: 'Gender', value: UserUtils.currentUser!.gender),
    ProfileData(title: 'Age', value: UserUtils.currentUser!.age),
    ProfileData(title: 'Height', value: UserUtils.currentUser!.height),
    ProfileData(title: 'Weight', value: UserUtils.currentUser!.weight),
    ProfileData(
        title: 'Percent Body Fat',
        value: UserUtils.currentUser!.percentBodyFat),
    ProfileData(title: 'Fat Mass', value: UserUtils.currentUser!.fatMass),
    ProfileData(title: 'Muscle Mass', value: UserUtils.currentUser!.muscleMass),
    ProfileData(title: 'BMI', value: UserUtils.currentUser!.bmi),
  ];
}
