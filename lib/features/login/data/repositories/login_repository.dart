import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_fit/core/shared/user_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/firebase_exceptions.dart';
import 'package:cross_fit/injector.dart' as di;

import '../../../../core/shared/user_model.dart';
import '../../../profile/presentation/manager/profile_utils.dart';

abstract class ILoginRepository {
  Future<Either<AuthException,User>> loginWithEmailAndPassword(
      {required String email, required String password});
}

class LoginRepository implements ILoginRepository {
  final FirebaseAuth _firebaseAuth;
  LoginRepository(this._firebaseAuth);

  @override
  Future<Either<AuthException,User>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final sharedPrefrences = di.sl<SharedPreferences>();
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      await sharedPrefrences.setString(
          'userModel', jsonEncode(userData.data()));
      UserUtils.currentUser = UserModel.fromMap(userData.data()!);
      UserUtils.uid = UserUtils.currentUser!.uid;
      profileDataList;
      log('${UserUtils.currentUser}');
      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(AuthException(e.code, e.message ?? 'Something went wrong'));
    }
  }
}
