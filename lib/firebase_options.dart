import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxlNyjpMRgb6jzZuZEhzYN3NvXOEXHF6k',
    appId: '1:199324795727:android:2da93b482d110c40253b3a',
    messagingSenderId: '199324795727',
    projectId: 'lynxride-driver',
    storageBucket: 'lynxride-driver.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQa322f3Xdlp82pG9LV0LTv3osKr1gfrw',
    appId: '1:199324795727:ios:cf8d7598a9857cd9253b3a',
    messagingSenderId: '199324795727',
    projectId: 'lynxride-driver',
    storageBucket: 'lynxride-driver.firebasestorage.app',
    androidClientId: '199324795727-mdushkl0smh60umaipuorkf70snndjrs.apps.googleusercontent.com',
    iosClientId: '199324795727-siadfotqilnuh7qmi7tm7ftdvptkksj1.apps.googleusercontent.com',
    iosBundleId: 'com.swiftex.lynxridedriver',
  );
}
