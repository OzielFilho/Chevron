// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchedulingController on _SchedulingControllerBase, Store {
  final _$schedulesAtom = Atom(name: '_SchedulingControllerBase.schedules');

  @override
  List<Schedule> get schedules {
    _$schedulesAtom.reportRead();
    return super.schedules;
  }

  @override
  set schedules(List<Schedule> value) {
    _$schedulesAtom.reportWrite(value, super.schedules, () {
      super.schedules = value;
    });
  }

  final _$getSchedulesAsyncAction =
      AsyncAction('_SchedulingControllerBase.getSchedules');

  @override
  Future<void> getSchedules({BuildContext? context}) {
    return _$getSchedulesAsyncAction
        .run(() => super.getSchedules(context: context));
  }

  @override
  String toString() {
    return '''
schedules: ${schedules}
    ''';
  }
}
