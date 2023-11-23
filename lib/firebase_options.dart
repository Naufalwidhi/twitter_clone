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
    apiKey: 'AIzaSyAAtAFPrd0CFHsbqv3hnhh5YvJ_o9FF1z0',
    appId: '1:483744469628:web:f8f5032114058b7dc66ff9',
    messagingSenderId: '483744469628',
    projectId: 'minimal-socialmedia',
    authDomain: 'minimal-socialmedia.firebaseapp.com',
    storageBucket: 'minimal-socialmedia.appspot.com',
    measurementId: 'G-Q3K9BYZWMY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFP-xjpK7aBSSIzmRPCcIAAiyQ6HEUK4o',
    appId: '1:483744469628:android:76d7f60f2c08ee52c66ff9',
    messagingSenderId: '483744469628',
    projectId: 'minimal-socialmedia',
    storageBucket: 'minimal-socialmedia.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDomRVgr9QP2Hj__ca4JLoFCBKPLj3mRHo',
    appId: '1:483744469628:ios:2231ab5d6c2aa5bec66ff9',
    messagingSenderId: '483744469628',
    projectId: 'minimal-socialmedia',
    storageBucket: 'minimal-socialmedia.appspot.com',
    iosBundleId: 'com.twitter.clone.twitterCloneFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDomRVgr9QP2Hj__ca4JLoFCBKPLj3mRHo',
    appId: '1:483744469628:ios:593516a940543534c66ff9',
    messagingSenderId: '483744469628',
    projectId: 'minimal-socialmedia',
    storageBucket: 'minimal-socialmedia.appspot.com',
    iosBundleId: 'com.twitter.clone.twitterCloneFirebase.RunnerTests',
  );
}