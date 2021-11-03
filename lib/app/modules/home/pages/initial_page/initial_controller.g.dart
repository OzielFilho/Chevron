// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitialController on _InitialControllerBase, Store {
  final _$storesAtom = Atom(name: '_InitialControllerBase.stores');

  @override
  Stores? get stores {
    _$storesAtom.reportRead();
    return super.stores;
  }

  @override
  set stores(Stores? value) {
    _$storesAtom.reportWrite(value, super.stores, () {
      super.stores = value;
    });
  }

  final _$getBarbersStoreinFirestoreAsyncAction =
      AsyncAction('_InitialControllerBase.getBarbersStoreinFirestore');

  @override
  Future<void> getBarbersStoreinFirestore() {
    return _$getBarbersStoreinFirestoreAsyncAction
        .run(() => super.getBarbersStoreinFirestore());
  }

  @override
  String toString() {
    return '''
stores: ${stores}
    ''';
  }
}
