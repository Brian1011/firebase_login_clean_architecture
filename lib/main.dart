import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_clean_architecture/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBUm7ZGFnbJWboUdu7W7wlw_wrgafhCKYA',
    appId: '1:706275468569:android:08613594c0ea00f1a15188',
    messagingSenderId: '...',
    projectId: 'clean-architecture-18a4e"',
  ));
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
