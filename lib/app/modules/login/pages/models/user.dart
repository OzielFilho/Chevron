import 'dart:convert';

import 'package:barbershop/app/modules/login/pages/models/order.dart';

class UserFirebase {
  final String name;
  final String email;

  final List<Order> orders;

  UserFirebase({
    required this.name,
    required this.email,
    required this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'orders': orders.map((x) => x.toMap()).toList(),
    };
  }

  factory UserFirebase.fromMap(Map<String, dynamic> map) {
    return UserFirebase(
      name: map['name'],
      email: map['email'],
      orders: List<Order>.from(map['orders']?.map((x) => Order.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFirebase.fromJson(String source) =>
      UserFirebase.fromMap(json.decode(source));
}
