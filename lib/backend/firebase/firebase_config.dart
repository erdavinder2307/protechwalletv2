import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA4tmnTsFZXa2iou2nEnx-ojrLKbJ0wAq8",
            authDomain: "protechwallet-c1d49.firebaseapp.com",
            projectId: "protechwallet-c1d49",
            storageBucket: "protechwallet-c1d49.appspot.com",
            messagingSenderId: "635133701048",
            appId: "1:635133701048:web:c3ff2a3b0a535c2095fd4d",
            measurementId: "G-GJZP3K42DT"));
  } else {
    await Firebase.initializeApp();
  }
}
