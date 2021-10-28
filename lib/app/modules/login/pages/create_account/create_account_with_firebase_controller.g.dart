// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_with_firebase_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountWithFirebaseController
    on _CreateAccountWithFirebaseControllerBase, Store {
  final _$emailCreateAtom =
      Atom(name: '_CreateAccountWithFirebaseControllerBase.emailCreate');

  @override
  TextEditingController get emailCreate {
    _$emailCreateAtom.reportRead();
    return super.emailCreate;
  }

  @override
  set emailCreate(TextEditingController value) {
    _$emailCreateAtom.reportWrite(value, super.emailCreate, () {
      super.emailCreate = value;
    });
  }

  final _$passwordCreateAtom =
      Atom(name: '_CreateAccountWithFirebaseControllerBase.passwordCreate');

  @override
  TextEditingController get passwordCreate {
    _$passwordCreateAtom.reportRead();
    return super.passwordCreate;
  }

  @override
  set passwordCreate(TextEditingController value) {
    _$passwordCreateAtom.reportWrite(value, super.passwordCreate, () {
      super.passwordCreate = value;
    });
  }

  final _$nameCreateAtom =
      Atom(name: '_CreateAccountWithFirebaseControllerBase.nameCreate');

  @override
  TextEditingController get nameCreate {
    _$nameCreateAtom.reportRead();
    return super.nameCreate;
  }

  @override
  set nameCreate(TextEditingController value) {
    _$nameCreateAtom.reportWrite(value, super.nameCreate, () {
      super.nameCreate = value;
    });
  }

  final _$createAccountInDataBaseAsyncAction = AsyncAction(
      '_CreateAccountWithFirebaseControllerBase.createAccountInDataBase');

  @override
  Future<void> createAccountInDataBase(
      {BuildContext? context, UserFirebase? userFirebase, String? uid}) {
    return _$createAccountInDataBaseAsyncAction.run(() => super
        .createAccountInDataBase(
            context: context, userFirebase: userFirebase, uid: uid));
  }

  final _$createAccountWithFirebaseAsyncAction = AsyncAction(
      '_CreateAccountWithFirebaseControllerBase.createAccountWithFirebase');

  @override
  Future createAccountWithFirebase({BuildContext? context}) {
    return _$createAccountWithFirebaseAsyncAction
        .run(() => super.createAccountWithFirebase(context: context));
  }

  @override
  String toString() {
    return '''
emailCreate: ${emailCreate},
passwordCreate: ${passwordCreate},
nameCreate: ${nameCreate}
    ''';
  }
}
