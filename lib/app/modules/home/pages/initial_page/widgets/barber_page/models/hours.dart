import 'dart:convert';

class Hours {
  String day;
  String hour;
  Hours({
    required this.day,
    required this.hour,
  });

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'hour': hour,
    };
  }

  factory Hours.fromMap(Map<String, dynamic> map) {
    return Hours(
      day: map['day'],
      hour: map['hour'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Hours.fromJson(String source) => Hours.fromMap(json.decode(source));
}
