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
    apiKey: 'AIzaSyDPXZSu1jqqnfC_tDg-Nu_pRcjzW1jTq5w',
    appId: '1:354952992774:web:8fea7a1504b3edc1160b87',
    messagingSenderId: '354952992774',
    projectId: 'ecosmart-f746e',
    authDomain: 'ecosmart-f746e.firebaseapp.com',
    storageBucket: 'ecosmart-f746e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDk3u5NIoMRaUlOZWLzWTB6dxwAbpylmk',
    appId: '1:354952992774:android:821e61b4f7c204c1160b87',
    messagingSenderId: '354952992774',
    projectId: 'ecosmart-f746e',
    storageBucket: 'ecosmart-f746e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB101oOlHJIU2rMGhkKKv4sS5piZEhYsGw',
    appId: '1:354952992774:ios:b3ec93db1a64f579160b87',
    messagingSenderId: '354952992774',
    projectId: 'ecosmart-f746e',
    storageBucket: 'ecosmart-f746e.firebasestorage.app',
    iosBundleId: 'com.example.ecoSmart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB101oOlHJIU2rMGhkKKv4sS5piZEhYsGw',
    appId: '1:354952992774:ios:b3ec93db1a64f579160b87',
    messagingSenderId: '354952992774',
    projectId: 'ecosmart-f746e',
    storageBucket: 'ecosmart-f746e.firebasestorage.app',
    iosBundleId: 'com.example.ecoSmart',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPXZSu1jqqnfC_tDg-Nu_pRcjzW1jTq5w',
    appId: '1:354952992774:web:a7d90eb13a85ab98160b87',
    messagingSenderId: '354952992774',
    projectId: 'ecosmart-f746e',
    authDomain: 'ecosmart-f746e.firebaseapp.com',
    storageBucket: 'ecosmart-f746e.firebasestorage.app',
  );
}
