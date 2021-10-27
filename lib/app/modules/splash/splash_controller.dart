import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @action
  Future<bool> isUserLogged() async {
    final instanceFirebase = FirebaseAuth.instance;

    return instanceFirebase.currentUser != null;
  }
}
