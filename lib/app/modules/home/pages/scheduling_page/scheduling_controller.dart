import 'package:barbershop/app/modules/home/models/schedule.dart';
import 'package:barbershop/app/shared/utils/functions/error_msg/error_msg.dart';
import 'package:barbershop/app/shared/utils/functions/loading/loading_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'scheduling_controller.g.dart';

class SchedulingController = _SchedulingControllerBase
    with _$SchedulingController;

abstract class _SchedulingControllerBase with Store {
  @observable
  List<Schedule> schedules = [];

  @observable
  List<Schedule> schedulesFinalize = [];

  @action
  Future<void> getSchedules({BuildContext? context}) async {
    final User? user = FirebaseAuth.instance.currentUser;
    var ref = FirebaseFirestore.instance.collection('services').doc(user!.uid);
    try {
      await ref.get().then((value) {
        if (value.exists) {
          List schedule = value.data()!['schedules'];
          schedules = schedule.map((e) => Schedule.fromMap(e)).toList();
        } else {
          throw Exception();
        }
      });
    } on FirebaseException catch (e) {
      showErrorMessage(context: context!, message: e.message!, title: 'Erro');
    }
  }

  @action
  Future<void> getSchedulesFinalize({BuildContext? context}) async {
    final User? user = FirebaseAuth.instance.currentUser;
    var ref = FirebaseFirestore.instance.collection('services').doc(user!.uid);
    try {
      await ref.get().then((value) {
        if (value.exists) {
          List scheduleF = value.data()!['schedules_finalize'];
          schedulesFinalize =
              scheduleF.map((e) => Schedule.fromMap(e)).toList();
        } else {
          throw Exception();
        }
      });
    } on FirebaseException catch (e) {
      showErrorMessage(context: context!, message: e.message!, title: 'Erro');
    }
  }

  @action
  Future<void> finalizeSchedule(
      {BuildContext? context, int? indexSchedule}) async {
    showLoading(context: context!);
    final User? user = FirebaseAuth.instance.currentUser;
    var ref = FirebaseFirestore.instance.collection('services').doc(user!.uid);

    try {
      await ref.get().then((value) async {
        if (value.exists) {
          await ref.update({
            'schedules':
                FieldValue.arrayRemove([schedules[indexSchedule!].toMap()])
          }).whenComplete(() async {
            schedules[indexSchedule].complete = true;
            await ref.update({
              'schedules_finalize':
                  FieldValue.arrayUnion([schedules[indexSchedule].toMap()])
            });
            Modular.to.pop(context);
            getSchedules(context: context);
            getSchedulesFinalize(context: context);
          });
        }
      });
    } on FirebaseException catch (e) {
      Modular.to.pop(context);
      showErrorMessage(context: context, message: e.message!, title: 'Erro');
    }
  }
}
