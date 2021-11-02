import 'dart:convert';

import 'services_barber.dart';

class Barbers {
  String? name;
  String? description;
  String? photo;
  List<ServiceBarber>? services;
  Barbers({
    this.name,
    this.description,
    this.photo,
    this.services,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'photo': photo,
      'services': services?.map((x) => x.toMap()).toList(),
    };
  }

  factory Barbers.fromMap(Map<String, dynamic> map) {
    return Barbers(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      photo: map['photo'] ?? '',
      services: map['services'] != null
          ? List<ServiceBarber>.from(
              map['services']?.map((x) => ServiceBarber.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Barbers.fromJson(String source) =>
      Barbers.fromMap(json.decode(source));
}
