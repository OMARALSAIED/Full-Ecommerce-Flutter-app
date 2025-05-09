// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBYrXGy7bbG0zc4lA4Zq4vVwmUbn2fZk4U',
    appId: '1:441008324751:web:d59fba7abf3a0a8a4bb0fa',
    messagingSenderId: '441008324751',
    projectId: 'full-e-commerce-40b89',
    authDomain: 'full-e-commerce-40b89.firebaseapp.com',
    storageBucket: 'full-e-commerce-40b89.firebasestorage.app',
    measurementId: 'G-B0F9J64JGM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCIiOvS_Nc3EJgkwn2M_IGTxLYTiXU_Ik',
    appId: '1:441008324751:android:62627beae714df7c4bb0fa',
    messagingSenderId: '441008324751',
    projectId: 'full-e-commerce-40b89',
    storageBucket: 'full-e-commerce-40b89.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_jaY8G1tWAhEPTijsIr62L9Vd95M137w',
    appId: '1:441008324751:ios:406e90c0581d5d8b4bb0fa',
    messagingSenderId: '441008324751',
    projectId: 'full-e-commerce-40b89',
    storageBucket: 'full-e-commerce-40b89.firebasestorage.app',
    androidClientId: '441008324751-auqmash997rql7pp6l4bu9j590v6uu1l.apps.googleusercontent.com',
    iosClientId: '441008324751-h6ju0bepr89v53lj2vrl9th7sj28f3er.apps.googleusercontent.com',
    iosBundleId: 'omar.ecommerce',
  );

}