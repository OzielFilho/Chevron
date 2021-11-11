// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barber_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BarberPageController on _BarberPageControllerBase, Store {
  final _$professionalsAtom =
      Atom(name: '_BarberPageControllerBase.professionals');

  @override
  List<Professionals> get professionals {
    _$professionalsAtom.reportRead();
    return super.professionals;
  }

  @override
  set professionals(List<Professionals> value) {
    _$professionalsAtom.reportWrite(value, super.professionals, () {
      super.professionals = value;
    });
  }

  @override
  String toString() {
    return '''
professionals: ${professionals}
    ''';
  }
}
