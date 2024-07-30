import 'package:cross_fit/core/utils/assets_manager.dart';

class GenderModel
{
  final String title;
  final String image;

  GenderModel({required this.title, required this.image});
}

List<GenderModel> genders = [
  GenderModel(title: 'Male', image: ImgAssets.male),
  GenderModel(title: 'Female', image: ImgAssets.female)
];