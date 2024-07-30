class AuthException implements Exception {
  final String code;
  final String message;

  AuthException(this.code, this.message);

  String errorMessage()
  {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'user-not-found':
        return 'The user corresponding to the given email does not exist.';
      case 'wrong-password':
        return 'The password is invalid for the given email, or the account corresponding to the email does not have a password set.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'operation-not-allowed':
        return 'Indicates that Email & Password accounts are not enabled.';
      case 'weak-password':
        return 'The password must be 6 characters long or more.';
      default:
        return 'Something went wrong';
    }
  }
}