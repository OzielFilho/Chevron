import 'dart:convert';

import 'package:barbershop/app/modules/home/models/barbers.dart';
import 'package:barbershop/app/modules/home/models/services_barber.dart';

class Schedule {
  String? nameStore;
  String? clientName;
  ServiceBarber? service;
  Barbers? barbers;
  String? createAt;
  String? updateAt;

  Schedule({
    this.nameStore,
    this.clientName,
    this.service,
    this.barbers,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'nameStore': nameStore,
      'clientName': clientName,
      'service': service?.toMap(),
      'barbers': barbers?.toMap(),
      'createAt': createAt,
      'updateAt': updateAt,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      nameStore: map['nameStore'] ?? '',
      clientName: map['clientName'] ?? '',
      service:
          map['service'] != null ? ServiceBarber.fromMap(map['service']) : null,
      barbers: map['barbers'] != null ? Barbers.fromMap(map['barbers']) : null,
      createAt: map['createAt'] ?? '',
      updateAt: map['updateAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source));
}
