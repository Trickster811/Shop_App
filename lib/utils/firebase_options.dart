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
    apiKey: 'AIzaSyBps_642Bzp4KbGVOtSPAoB2G4REs-OUKo',
    appId: '1:107950135645:web:100c8e2e5f1eeb3c4070b4',
    messagingSenderId: '107950135645',
    projectId: 'b-shop24',
    authDomain: 'b-shop24.firebaseapp.com',
    storageBucket: 'b-shop24.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArDE_mUuLoIwhIvcmVZUWblgl2DuyXL1w',
    appId: '1:107950135645:android:19c6b4df733d85c24070b4',
    messagingSenderId: '107950135645',
    projectId: 'b-shop24',
    storageBucket: 'b-shop24.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8f2Vzp3dJDLncff-wIiZuZKU0Fc5i3lg',
    appId: '1:107950135645:ios:ec66fdb15923df844070b4',
    messagingSenderId: '107950135645',
    projectId: 'b-shop24',
    storageBucket: 'b-shop24.appspot.com',
    iosBundleId: 'com.example.bShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8f2Vzp3dJDLncff-wIiZuZKU0Fc5i3lg',
    appId: '1:107950135645:ios:ec66fdb15923df844070b4',
    messagingSenderId: '107950135645',
    projectId: 'b-shop24',
    storageBucket: 'b-shop24.appspot.com',
    iosBundleId: 'com.example.bShop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBps_642Bzp4KbGVOtSPAoB2G4REs-OUKo',
    appId: '1:107950135645:web:6bd71e321d0b8f0f4070b4',
    messagingSenderId: '107950135645',
    projectId: 'b-shop24',
    authDomain: 'b-shop24.firebaseapp.com',
    storageBucket: 'b-shop24.appspot.com',
  );

}