import 'package:barbershop/app/shared/utils/functions/error_msg/error_msg.dart';
import 'package:barbershop/app/shared/utils/functions/loading/loading_custom.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  TextEditingController? controllerEmail = TextEditingController();
  @observable
  TextEditingController? controllerPassword = TextEditingController();

  @action
  Future<void> loginFirebase(BuildContext context) async {
    showLoading(context: context);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: controllerEmail!.text, password: controllerPassword!.text)
          .then((value) {
        Modular.to.pop(context);
        if (value.user != null) {
          Modular.to.pushReplacementNamed('/home/');
        } else {
          showErrorMessage(
              context: context,
              message: 'Usuário não encontrado!',
              title: 'Error');
        }
      });
    } on FirebaseAuthException catch (e) {
      Modular.to.pop(context);
      showErrorMessage(context: context, message: e.message!, title: 'Erro');
    } catch (e) {
      Modular.to.pop(context);
      showErrorMessage(context: context, message: 'Error', title: 'Error');
    }
  }
}
