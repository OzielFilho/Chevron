import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @action
  bool isUserLogged() {
    final instanceFirebase = FirebaseAuth.instance;

    return instanceFirebase.currentUser != null;
  }

  @action
  transtionPageSplash() {
    return Future.delayed(
        const Duration(seconds: 3),
        () => isUserLogged()
            ? Modular.to.pushReplacementNamed('/home/')
            : Modular.to.pushReplacementNamed('/login/'));
  }
}
