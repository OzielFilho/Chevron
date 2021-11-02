// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  @override
  String toString() {
    return '''
userFirebase: ${userFirebase}
    ''';
  }
}
