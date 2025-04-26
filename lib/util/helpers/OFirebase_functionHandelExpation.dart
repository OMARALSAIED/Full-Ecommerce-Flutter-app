class OFirebaseAuthExceptionHandler {
  static String handleException(String code) {
    switch (code) {
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح. تأكد من كتابته بشكل صحيح.';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب. تواصل مع الدعم.';
      case 'user-not-found':
        return 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة. حاول مرة أخرى.';
      case 'email-already-in-use':
        return 'هذا البريد مستخدم بالفعل. جرب بريدًا آخر.';
      case 'operation-not-allowed':
        return 'هذه العملية غير مسموحة. تواصل مع الدعم.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة. الرجاء استخدام كلمة مرور أقوى.';
      case 'too-many-requests':
        return 'عدد كبير من المحاولات. الرجاء المحاولة لاحقًا.';
      case 'network-request-failed':
        return 'فشل الاتصال بالإنترنت. تأكد من الشبكة وحاول مجددًا.';
      default:
        return 'حدث خطأ غير متوقع. الرجاء المحاولة لاحقًا.';
    }
  }
}
