import 'dart:convert';

import 'package:barbershop/app/modules/home/models/schedule.dart';

class UserFirebase {
  final String name;
  final String email;
  final String? photo;
  final List<Schedule> schedules;
  UserFirebase({
    required this.schedules,
    required this.name,
    required this.email,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
      'schedules': schedules.map((x) => x.toMap()).toList(),
    };
  }

  factory UserFirebase.fromMap(Map<String, dynamic> map) {
    return UserFirebase(
      name: map['name'],
      email: map['email'],
      photo: map['photo'] ?? '',
      schedules: List<Schedule>.from(
          map['schedules']?.map((x) => Schedule.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFirebase.fromJson(String source) =>
      UserFirebase.fromMap(json.decode(source));
}
