import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDXsqP1YUfNRRJ81AOxRoq-ASII0Pu_N1Q",
            authDomain: "ubicadog-app-3a84f.firebaseapp.com",
            projectId: "ubicadog-app-3a84f",
            storageBucket: "ubicadog-app-3a84f.appspot.com",
            messagingSenderId: "353124026676",
            appId: "1:353124026676:web:6e5b93892d7874314c3d61"));
  } else {
    await Firebase.initializeApp();
  }
}
