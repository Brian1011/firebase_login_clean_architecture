import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_clean_architecture/app/core/pages/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
      ];

  /*@override
  List<ModuleRoute> get routes => [
    ChildRoute("/", child: (context, args) => SplashScreen()),
  ];*/

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashScreen()),
      ];
}
