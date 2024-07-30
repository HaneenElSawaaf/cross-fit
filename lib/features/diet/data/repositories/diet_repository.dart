import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_fit/core/shared/diet_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/shared/user_utils.dart';
import '../../../../core/utils/constants.dart';

abstract class IDietRepository {
  Future<Either<FirebaseException, DietModel>> getDietData();
}

class DietRepository implements IDietRepository {
  final FirebaseFirestore _firestore;
  DietRepository(this._firestore);

  @override
  Future<Either<FirebaseException, DietModel>> getDietData() async {
    try {
      final response =
          await _firestore.collection(FirebaseConstants.usersCollection).doc(UserUtils.uid).get();
      return Right(DietModel.fromJson(response.data()!['diet']));
    } on FirebaseException catch (e) {
      return Left(e);
    }
  }
}
