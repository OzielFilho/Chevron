import 'package:barbershop/app/modules/login/pages/models/user_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'pages/initial_page/initial_page.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int index = 0;

  @observable
  List<Widget?> pages = [
    const InitialPage(),
    Container(),
  ];

  @action
  int getIndex() => index;

  @action
  setIndex(int? i) => index = i!;

  @observable
  UserFirebase? userFirebase;
  @action
  Future<void> getUserinFirestore() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);

    await document.get().then((value) {
      final Map<String, dynamic> data = value.data() as Map<String, dynamic>;
      userFirebase = UserFirebase.fromMap(data);
    });
  }

  @action
  Future<void> logoutFirebase() async => await FirebaseAuth.instance
      .signOut()
      .whenComplete(() => Modular.to.pushReplacementNamed('/login/'));
}
