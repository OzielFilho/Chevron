import 'dart:convert';

class Order {
  final String date;
  final String client;
  final int value;
  final String procedure;

  Order({
    required this.date,
    required this.client,
    required this.value,
    required this.procedure,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'client': client,
      'value': value,
      'procedure': procedure,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      date: map['date'],
      client: map['client'],
      value: map['value'],
      procedure: map['procedure'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
