// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyCw8jFrpRucraIY6knzLzeDofMAbCi8Ems',
    appId: '1:255296517579:web:f7c032eee130a732daf24e',
    messagingSenderId: '255296517579',
    projectId: 'sr-health',
    authDomain: 'sr-health.firebaseapp.com',
    storageBucket: 'sr-health.appspot.com',
    measurementId: 'G-TT7CQK8KML',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1Wq6ShLNYMigeCzJuLCQj_Mi2TP7Wdww',
    appId: '1:255296517579:android:1fa732d32ddff4aedaf24e',
    messagingSenderId: '255296517579',
    projectId: 'sr-health',
    storageBucket: 'sr-health.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLcbP9QoVCEkLJhuGfl7IbMbnq9hHNuT4',
    appId: '1:255296517579:ios:83bca86ddce6e825daf24e',
    messagingSenderId: '255296517579',
    projectId: 'sr-health',
    storageBucket: 'sr-health.appspot.com',
    iosBundleId: 'appsrh.com.appSrh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLcbP9QoVCEkLJhuGfl7IbMbnq9hHNuT4',
    appId: '1:255296517579:ios:cf8a52501206eee4daf24e',
    messagingSenderId: '255296517579',
    projectId: 'sr-health',
    storageBucket: 'sr-health.appspot.com',
    iosBundleId: 'appsrh.com.appSrh.RunnerTests',
  );
}
