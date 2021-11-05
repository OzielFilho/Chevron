import 'package:barbershop/app/modules/home/models/schedule.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/scheduling_page.dart';
import 'package:barbershop/app/modules/login/pages/models/user_firebase.dart';
import 'package:barbershop/app/shared/utils/functions/error_msg/error_msg.dart';
import 'package:barbershop/app/shared/utils/functions/loading/loading_custom.dart';
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
  List schedulings = [];

  @action
  Future<void> createNewSchedule(
      {required BuildContext context, Schedule? schedule}) async {
    showLoading(context: context);
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'schedules': FieldValue.arrayUnion([schedule!.toMap()])
      }).whenComplete(() {
        Modular.to.pop(context);
      });
    } on FirebaseException catch (e) {
      Modular.to.pop(context);
      showErrorMessage(
          context: context,
          title: 'Error ao criar um agendamento',
          message: e.message!);
    }
  }

  @observable
  int index = 0;

  @observable
  List<Widget?> pages = [
    const InitialPage(),
    const SchedulingPage(),
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
