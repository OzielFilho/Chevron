import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  Future<void> logoutFirebase() async => await FirebaseAuth.instance
      .signOut()
      .whenComplete(() => Modular.to.pushReplacementNamed('/login/'));
}
