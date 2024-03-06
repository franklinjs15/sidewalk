import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAgrlPcqwFYzjoWtTK9hjW4KcuKH7IYG60",
            authDomain: "sidewalk-flutterflow.firebaseapp.com",
            projectId: "sidewalk-flutterflow",
            storageBucket: "sidewalk-flutterflow.appspot.com",
            messagingSenderId: "157254285633",
            appId: "1:157254285633:web:99f5a78997b95a81ea09c0",
            measurementId: "G-NNTDNX4KNN"));
  } else {
    await Firebase.initializeApp();
  }
}
