import 'dart:convert';

import 'package:barbershop/app/modules/home/models/barbers.dart';

class Stores {
  List<Barbers> listBarbers;
  Stores({
    required this.listBarbers,
  });

  Map<String, dynamic> toMap() {
    return {
      'list_barbers': listBarbers.map((x) => x.toMap()).toList(),
    };
  }

  factory Stores.fromMap(Map<String, dynamic> map) {
    return Stores(
      listBarbers: List<Barbers>.from(
          map['list_barbers']?.map((x) => Barbers.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stores.fromJson(String source) => Stores.fromMap(json.decode(source));
}
