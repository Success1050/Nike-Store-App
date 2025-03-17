import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAYjwxLmKAdDz2HDeLN6VaNgTD2bjt9pgs",
            authDomain: "nike-shoes-store-d8afd.firebaseapp.com",
            projectId: "nike-shoes-store-d8afd",
            storageBucket: "nike-shoes-store-d8afd.firebasestorage.app",
            messagingSenderId: "589205815084",
            appId: "1:589205815084:web:2a9c85e55891b17f8cb689"));
  } else {
    await Firebase.initializeApp();
  }
}
