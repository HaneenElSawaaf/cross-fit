import 'package:cross_fit/core/errors/firebase_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IProfileRepository {
  Future<Either<AuthException, void>> signout();
}

class ProfileRepository implements IProfileRepository {
  final FirebaseAuth _firebaseAuth;
  ProfileRepository(this._firebaseAuth);
  @override
  Future<Either<AuthException, void>> signout() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthException(e.code, e.message ?? 'Something went wrong'));
    }
  }
}
