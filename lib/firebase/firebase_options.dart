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
      apiKey: "AIzaSyA3gpQSoIz8GAKNgumg3c82qf0aq9X6to8",
      authDomain: "techmall-analytic.firebaseapp.com",
      databaseURL: "https://techmall-analytic-default-rtdb.firebaseio.com",
      projectId: "techmall-analytic",
      storageBucket: "techmall-analytic.appspot.com",
      messagingSenderId: "703762887981",
      appId: "1:703762887981:web:9f7ef965681dedcf3f0fa4",
      measurementId: "G-18HQ7W5422");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZL2c7Nt1ItikTZMdkBTC1rWZY1X7fPDo',
    appId: '1:835155915687:android:144c9d6b8613f5003bfc82',
    messagingSenderId: '835155915687',
    projectId: 'techmall-410119',
    storageBucket: 'techmall-410119.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuRq0ZjQS7yaFwdK8oxt1tmDRSPVjZCiQ',
    appId: '1:835155915687:ios:397c2137b2540ab03bfc82',
    messagingSenderId: '835155915687',
    projectId: 'techmall-410119',
    storageBucket: 'techmall-410119.appspot.com',
    iosBundleId: 'com.example.fluttertiff',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAuRq0ZjQS7yaFwdK8oxt1tmDRSPVjZCiQ',
    appId: '1:835155915687:ios:f3c423039814b8503bfc82',
    messagingSenderId: '835155915687',
    projectId: 'techmall-410119',
    storageBucket: 'techmall-410119.appspot.com',
    iosBundleId: 'com.example.fluttertiff.RunnerTests',
  );
}