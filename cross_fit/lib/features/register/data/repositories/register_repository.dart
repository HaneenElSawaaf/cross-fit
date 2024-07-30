import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/firebase_exceptions.dart';
import '../../../../core/shared/user_model.dart';
import '../../../../core/shared/user_utils.dart';

import 'package:cross_fit/injector.dart' as di;

import '../../../../core/utils/constants.dart';
import '../../../profile/presentation/manager/profile_utils.dart';

abstract class IRegisterRepository {
  Future<Either<AuthException, void>> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String gender,
      required int age,
      required String trainingGoal,
      required double height,
      required double weight,
      required double percentBodyFat,
      required double muscleMass,
      required double bmi,
      required double fatMass});

  Future<bool> isEmailTaken(String email);

  Future addUserToFirestore(
      {required User user,
      required String name,
      required String gender,
      required int age,
      required String trainingGoal,
      required double height,
      required double weight,
      required double percentBodyFat,
      required double muscleMass,
      required double bmi,
      required double fatMass});
}

class RegisterRepository implements IRegisterRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  RegisterRepository(this._firebaseAuth, this._firestore);

  @override
  Future<Either<AuthException, void>> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String gender,
      required int age,
      required String trainingGoal,
      required double height,
      required double weight,
      required double percentBodyFat,
      required double muscleMass,
      required double bmi,
      required double fatMass}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUserToFirestore(
          user: userCredential.user!,
          name: name,
          gender: gender,
          age: age,
          trainingGoal: trainingGoal,
          height: height,
          weight: weight,
          percentBodyFat: percentBodyFat,
          muscleMass: muscleMass,
          bmi: bmi,
          fatMass: fatMass);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthException(e.code, e.message ?? 'Something went wrong'));
    }
  }

  @override
  Future<bool> isEmailTaken(String email) async {
    try {
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      // Handle any exceptions here
      return false;
    }
  }

  @override
  Future addUserToFirestore(
      {required User user,
      required String name,
      required String gender,
      required int age,
      required String trainingGoal,
      required double height,
      required double weight,
      required double percentBodyFat,
      required double muscleMass,
      required double bmi,
      required double fatMass}) async {
    final userMap = UserModel(
        uid: user.uid,
        name: name,
        email: user.email!,
        gender: gender,
        trainingGoal: trainingGoal,
        age: age,
        height: height,
        weight: weight,
        percentBodyFat: percentBodyFat,
        muscleMass: muscleMass,
        bmi: bmi,
        fatMass: fatMass);
    try {
      final sharedPrefrences = di.sl<SharedPreferences>();
      await sharedPrefrences.setString(
          'userModel', jsonEncode(userMap.toMap()));
      await _firestore
          .collection(FirebaseConstants.usersCollection)
          .doc(user.uid)
          .set(userMap.toMap());
      await _addDietToUserAccount(user.uid, bmi);
      UserUtils.currentUser = userMap;
      UserUtils.uid = user.uid;
      profileDataList;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _addDietToUserAccount(userId, bmi) async {
    try {
      List<String> diets = ['AJ31kKMIoxFy6jk3HZiu', '8eTrkKkHaRhPzzu7rtBa'];
      if (bmi < 23) {
        final response = await _firestore
            .collection(FirebaseConstants.dietsCollection)
            .doc(diets[0])
            .get();
        await _firestore
            .collection(FirebaseConstants.usersCollection)
            .doc(userId)
            .update({'diet': response.data()});
      } else {
        final response = await _firestore
            .collection(FirebaseConstants.dietsCollection)
            .doc(diets[1])
            .get();
        await _firestore
            .collection(FirebaseConstants.usersCollection)
            .doc(userId)
            .update({'diet': response.data()});
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
