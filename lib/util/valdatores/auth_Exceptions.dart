class SthandelAuthExpetions implements Exception
{
   final   String code;

   SthandelAuthExpetions(this.code);

   String get message {
  switch (code) {
    case 'email-already-in-use':
      return 'This e-mail address is already registered. Please use a different e-mail.';
    case 'invalid-email':
      return 'The e-mail address you entered is not valid. Please enter a correct e-mail.';
    case 'weak-password':
      return 'The password is too weak. Please choose a stronger password.';
    case 'user-not-found':
      return 'No account found for this e-mail. Please check your e-mail or register.';
    case 'wrong-password':
      return 'Incorrect password. Please try again.';
    case 'user-disabled':
      return 'This user account has been disabled. Please contact support.';
    case 'too-many-requests':
      return 'Too many attempts. Please try again later.';
    case 'operation-not-allowed':
      return 'This operation is not allowed. Please contact support.';
    default:
      return 'An unexpected error occurred. Please try again later.';
  }
}

}