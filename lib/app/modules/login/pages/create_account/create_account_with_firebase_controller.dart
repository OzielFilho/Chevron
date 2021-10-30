import 'dart:io';

import 'package:barbershop/app/modules/login/pages/models/user_firebase.dart';
import 'package:barbershop/app/shared/utils/functions/error_msg/error_msg.dart';
import 'package:barbershop/app/shared/utils/functions/loading/loading_custom.dart';
import 'package:barbershop/app/shared/utils/functions/snack_bar/snack_bar_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
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
  Future<File> getImageFile({required bool isCam}) async {
    return await ImagePicker()
        .pickImage(source: isCam ? ImageSource.camera : ImageSource.gallery)
        .then((value) async => await value!
            .readAsBytes()
            .then((value) => File.fromRawPath(value)));
  }

  @action
  Future<void> insertImageinStorageFirebase({File? file}) async {
    String? uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseStorage.instance
        .ref('users')
        .child(uid)
        .writeToFile(file!)
        .then((p0) => print(p0.ref.name));
  }

  @action
  Future<void> createAccountInDataBase(
      {BuildContext? context, UserFirebase? userFirebase, String? uid}) async {
    showLoading(context: context!);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userFirebase!.toMap());
    } on FirebaseException catch (e) {
      Modular.to.pop();
      showErrorMessage(
          context: context,
          title: 'Error ao criar o usuário',
          message: e.message!);
    }
  }

  @action
  createAccountWithFirebase({BuildContext? context}) async {
    showLoading(context: context!);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailCreate.text,
        password: passwordCreate.text,
      )
          .then((value) {
        UserFirebase userCreate = UserFirebase(
          name: nameCreate.text,
          email: value.user!.email!,
        );
        createAccountInDataBase(
                context: context,
                uid: value.user!.uid,
                userFirebase: userCreate)
            .whenComplete(() => showSnackBar(
                context: context,
                action: null,
                body: 'Usuário Criado! Faça o Login'));
      });
    } on FirebaseAuthException catch (e) {
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
