// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$schedulingsAtom = Atom(name: '_HomeControllerBase.schedulings');

  @override
  List<dynamic> get schedulings {
    _$schedulingsAtom.reportRead();
    return super.schedulings;
  }

  @override
  set schedulings(List<dynamic> value) {
    _$schedulingsAtom.reportWrite(value, super.schedulings, () {
      super.schedulings = value;
    });
  }

  final _$indexAtom = Atom(name: '_HomeControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$pagesAtom = Atom(name: '_HomeControllerBase.pages');

  @override
  List<Widget?> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(List<Widget?> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  final _$userFirebaseAtom = Atom(name: '_HomeControllerBase.userFirebase');

  @override
  UserFirebase? get userFirebase {
    _$userFirebaseAtom.reportRead();
    return super.userFirebase;
  }

  @override
  set userFirebase(UserFirebase? value) {
    _$userFirebaseAtom.reportWrite(value, super.userFirebase, () {
      super.userFirebase = value;
    });
  }

  final _$createNewScheduleAsyncAction =
      AsyncAction('_HomeControllerBase.createNewSchedule');

  @override
  Future<void> createNewSchedule(
      {required BuildContext context, Schedule? schedule}) {
    return _$createNewScheduleAsyncAction.run(
        () => super.createNewSchedule(context: context, schedule: schedule));
  }

  final _$getUserinFirestoreAsyncAction =
      AsyncAction('_HomeControllerBase.getUserinFirestore');

  @override
  Future<void> getUserinFirestore() {
    return _$getUserinFirestoreAsyncAction
        .run(() => super.getUserinFirestore());
  }

  final _$logoutFirebaseAsyncAction =
      AsyncAction('_HomeControllerBase.logoutFirebase');

  @override
  Future<void> logoutFirebase() {
    return _$logoutFirebaseAsyncAction.run(() => super.logoutFirebase());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  int getIndex() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getIndex');
    try {
      return super.getIndex();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int? i) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIndex');
    try {
      return super.setIndex(i);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
schedulings: ${schedulings},
index: ${index},
pages: ${pages},
userFirebase: ${userFirebase}
    ''';
  }
}
