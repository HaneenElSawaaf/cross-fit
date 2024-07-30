import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_fit/core/shared/user_utils.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/shared/diet_model.dart';

abstract class IHomeRepository {
  Future<Either<FirebaseException, DietModel>> getDietData();
}

class HomeRepository implements IHomeRepository {
  final FirebaseFirestore _firestore;
  HomeRepository(this._firestore);

  @override
  Future<Either<FirebaseException, DietModel>> getDietData() async {
    try {
      final response = await _firestore
          .collection(FirebaseConstants.usersCollection)
          .doc(UserUtils.uid)
          .get();
      return Right(DietModel.fromJson(response.data()!['diet']));
    } on FirebaseException catch (e) {
      log('ERROR Said: $e');
      return Left(e);
    }
  }
}
