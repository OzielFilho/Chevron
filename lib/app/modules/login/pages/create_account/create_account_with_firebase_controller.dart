import 'package:barbershop/app/modules/login/pages/models/user.dart';
import 'package:barbershop/app/shared/utils/functions/error_msg/error_msg.dart';
import 'package:barbershop/app/shared/utils/functions/loading/loading_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'create_account_with_firebase_controller.g.dart';

class CreateAccountWithFirebaseController = _CreateAccountWithFirebaseControllerBase
    with _$CreateAccountWithFirebaseController;

abstract class _CreateAccountWithFirebaseControllerBase with Store {
  @observable
  TextEditingController emailCreate = TextEditingController();
  @observable
  TextEditingController passwordCreate = TextEditingController();
  @observable
  TextEditingController nameCreate = TextEditingController();

  @action
  createAccountWithFirebase({BuildContext? context}) async {
    showLoading(context: context!);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailCreate.text,
        password: passwordCreate.text,
      )
          .then((value) async {
        UserFirebase userCreate = UserFirebase(
            name: nameCreate.text, email: value.user!.email!, orders: []);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set(userCreate.toMap())
            .whenComplete(() {
          Modular.to.pop();
        });
      }).whenComplete(() => Modular.to.pop());
    } on FirebaseAuthException catch (e) {
      Modular.to.pop();
      showErrorMessage(
          context: context,
          title: 'Error ao criar o usuário',
          message: e.message!);
    } on FirebaseException catch (e) {
      Modular.to.pop();
      showErrorMessage(
          context: context,
          title: 'Error ao criar o usuário',
          message: e.message!);
    } catch (e) {
      Modular.to.pop();
      showErrorMessage(
          context: context,
          title: 'Error ao criar o usuário',
          message: 'Entre em contato com o suporte');
    }
  }
}
