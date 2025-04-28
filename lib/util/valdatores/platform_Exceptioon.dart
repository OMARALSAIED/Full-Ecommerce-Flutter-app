class SthandelPlatformExceptions implements Exception {
  final String code;

  SthandelPlatformExceptions(this.code);

  String get message {
    switch (code) {
      case 'network_error':
        return 'Network error occurred. Please check your internet connection.';
      case 'permission_denied':
        return 'Permission denied. Please grant the required permissions.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'user_mismatch':
        return 'The user credentials do not match. Please check and try again.';
      case 'internal_error':
        return 'An internal error occurred. Please try again later.';
      case 'not_implemented':
        return 'This feature is not implemented yet.';
      default:
        return 'An unexpected platform error occurred. Please try again.';
    }
  }
}
