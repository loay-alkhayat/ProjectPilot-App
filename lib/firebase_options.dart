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
    apiKey: 'AIzaSyBh8HNIkTSsA4-fDTpffWDDHrnISjerXRQ',
    appId: '1:945576450571:web:aeb4b3bdd5f3ec44c9c50e',
    messagingSenderId: '945576450571',
    projectId: 'projectpilot-57f84',
    authDomain: 'projectpilot-57f84.firebaseapp.com',
    storageBucket: 'projectpilot-57f84.appspot.com',
    measurementId: 'G-9PFB5EGHBE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAX8RZE8inyWaszqTFFOXroWGhLZ4RhMwI',
    appId: '1:945576450571:android:3563480d8f0672aec9c50e',
    messagingSenderId: '945576450571',
    projectId: 'projectpilot-57f84',
    storageBucket: 'projectpilot-57f84.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBa98Dh9ROHjTqR1nl_vNGi17lytZYCc0',
    appId: '1:945576450571:ios:201603870bf5dd17c9c50e',
    messagingSenderId: '945576450571',
    projectId: 'projectpilot-57f84',
    storageBucket: 'projectpilot-57f84.appspot.com',
    iosBundleId: 'com.example.projectpilot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBa98Dh9ROHjTqR1nl_vNGi17lytZYCc0',
    appId: '1:945576450571:ios:201603870bf5dd17c9c50e',
    messagingSenderId: '945576450571',
    projectId: 'projectpilot-57f84',
    storageBucket: 'projectpilot-57f84.appspot.com',
    iosBundleId: 'com.example.projectpilot',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBh8HNIkTSsA4-fDTpffWDDHrnISjerXRQ',
    appId: '1:945576450571:web:4e25c305314b7f42c9c50e',
    messagingSenderId: '945576450571',
    projectId: 'projectpilot-57f84',
    authDomain: 'projectpilot-57f84.firebaseapp.com',
    storageBucket: 'projectpilot-57f84.appspot.com',
    measurementId: 'G-5VT9ZXE83C',
  );
}
