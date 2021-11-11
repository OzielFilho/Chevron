import 'dart:convert';

import 'package:barbershop/app/modules/home/models/barbers.dart';
import 'package:barbershop/app/modules/home/models/services_barber.dart';

class Schedule {
  String? nameStore;
  String? clientName;
  bool? complete;
  ServiceBarber? service;
  Barbers? barbers;
  String? createAt;
  String? updateAt;
  int? orderId;

  Schedule({
    this.complete,
    this.orderId,
    this.nameStore,
    this.clientName,
    this.service,
    this.barbers,
    this.createAt,
    this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'complete': complete ?? false,
      'orderId': orderId ?? 0,
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
      complete: map['complete'] ?? false,
      orderId: map['orderId'] ?? 0,
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
