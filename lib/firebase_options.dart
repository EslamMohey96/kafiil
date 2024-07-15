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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyD-AJR0vLFfZ_4E2Y7if6v0bWTFr7tJ4AU',
    appId: '1:377493536405:web:6a799e9c60b7f6dff3259c',
    messagingSenderId: '377493536405',
    projectId: 'kafiil-test',
    authDomain: 'kafiil-test.firebaseapp.com',
    storageBucket: 'kafiil-test.appspot.com',
    measurementId: 'G-F792L8YL9B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDO1iiHY_pq9b_IlKCnhe4fc4MG9U8W_9c',
    appId: '1:377493536405:android:01d31dd1b0a24c51f3259c',
    messagingSenderId: '377493536405',
    projectId: 'kafiil-test',
    storageBucket: 'kafiil-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoKww0zI6HuA_xaPwXjj_g9AC07_qI7sM',
    appId: '1:377493536405:ios:defb81792c58ae65f3259c',
    messagingSenderId: '377493536405',
    projectId: 'kafiil-test',
    storageBucket: 'kafiil-test.appspot.com',
    iosBundleId: 'com.example.kafiilTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoKww0zI6HuA_xaPwXjj_g9AC07_qI7sM',
    appId: '1:377493536405:ios:defb81792c58ae65f3259c',
    messagingSenderId: '377493536405',
    projectId: 'kafiil-test',
    storageBucket: 'kafiil-test.appspot.com',
    iosBundleId: 'com.example.kafiilTest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-AJR0vLFfZ_4E2Y7if6v0bWTFr7tJ4AU',
    appId: '1:377493536405:web:e77f155ce009a2f0f3259c',
    messagingSenderId: '377493536405',
    projectId: 'kafiil-test',
    authDomain: 'kafiil-test.firebaseapp.com',
    storageBucket: 'kafiil-test.appspot.com',
    measurementId: 'G-G09YQT2KNV',
  );
}