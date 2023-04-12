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
    apiKey: 'AIzaSyD2PexgdqOkZs8KF38MXGm9aUZas79Sw9k',
    appId: '1:108808000589:web:84bd0f313d99efb1c87804',
    messagingSenderId: '108808000589',
    projectId: 'war-history-1562c',
    authDomain: 'war-history-1562c.firebaseapp.com',
    storageBucket: 'war-history-1562c.appspot.com',
    measurementId: 'G-D5CS9SJ5PF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAnVkPjy6GqiaXQ4pNDrdk50TgFa1iTv8',
    appId: '1:108808000589:android:88f33699f179e403c87804',
    messagingSenderId: '108808000589',
    projectId: 'war-history-1562c',
    storageBucket: 'war-history-1562c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1NvYQeXqWeEMxJZoLblplNRXmEcApL1w',
    appId: '1:108808000589:ios:efd32c19131f9c56c87804',
    messagingSenderId: '108808000589',
    projectId: 'war-history-1562c',
    storageBucket: 'war-history-1562c.appspot.com',
    iosClientId: '108808000589-3omrslf7n1j20bmbvcln18dcid7pcb2d.apps.googleusercontent.com',
    iosBundleId: 'com.example.warhistory',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA1NvYQeXqWeEMxJZoLblplNRXmEcApL1w',
    appId: '1:108808000589:ios:efd32c19131f9c56c87804',
    messagingSenderId: '108808000589',
    projectId: 'war-history-1562c',
    storageBucket: 'war-history-1562c.appspot.com',
    iosClientId: '108808000589-3omrslf7n1j20bmbvcln18dcid7pcb2d.apps.googleusercontent.com',
    iosBundleId: 'com.example.warhistory',
  );
}
