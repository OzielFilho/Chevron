import 'package:barbershop/app/modules/home/models/stores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'initial_controller.g.dart';

class InitialController = _InitialControllerBase with _$InitialController;

abstract class _InitialControllerBase with Store {
  @observable
  Stores? stores;

  @action
  Future<void> getBarbersStoreinFirestore() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection('stores').doc('barbers');

    await document.get().then((value) {
      final Map<String, dynamic> data = value.data() as Map<String, dynamic>;
      stores = Stores.fromMap(data);
    });
  }
}
