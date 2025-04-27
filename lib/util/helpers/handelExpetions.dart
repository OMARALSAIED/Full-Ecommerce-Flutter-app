// دالة معالجة الاستثناءات
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

// دالة معالجة الاستثناءات
Future<void> handleExceptions(Object e) async {
  if (e is FirebaseAuthException) {
    // التعامل مع أخطاء FirebaseAuthException
    if (e.code == 'user-not-found') {
      throw 'No user found for that email.';
    } else if (e.code == 'invalid-email') {
      throw 'The email address is invalid.';
    } else if (e.code == 'too-many-requests') {
      throw 'Too many requests. Please try again later.';
    } else if (e.code == 'operation-not-allowed') {
      throw 'Email/Password accounts are not enabled. Please enable them in the Firebase Console.';
    } else if (e.code == 'requires-recent-login') {
      throw 'You need to re-authenticate before this operation.';
    } else {
      throw e.message ?? 'Something went wrong when verifying email.';
    }
  } else if (e is FormatException) {
    // التعامل مع FormatException
    throw 'Invalid format encountered: ${e.message}';
  } else if (e is PlatformException) {
    // التعامل مع PlatformException
    if (e.code == 'network_error') {
      throw 'Network error. Please check your connection and try again.';
    } else if (e.code == 'service_unavailable') {
      throw 'Service is temporarily unavailable. Please try again later.';
    } else {
      throw 'Platform error: ${e.message}';
    }
  } else {
    // التعامل مع الأخطاء العامة الأخرى
    throw 'Something went wrong. Please try again.';
  }
}