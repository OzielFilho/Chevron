// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$controllerEmailAtom =
      Atom(name: '_LoginControllerBase.controllerEmail');

  @override
  TextEditingController? get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController? value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  final _$controllerPasswordAtom =
      Atom(name: '_LoginControllerBase.controllerPassword');

  @override
  TextEditingController? get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController? value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  final _$loginFirebaseAsyncAction =
      AsyncAction('_LoginControllerBase.loginFirebase');

  @override
  Future loginFirebase(BuildContext context) {
    return _$loginFirebaseAsyncAction.run(() => super.loginFirebase(context));
  }

  @override
  String toString() {
    return '''
controllerEmail: ${controllerEmail},
controllerPassword: ${controllerPassword}
    ''';
  }
}
