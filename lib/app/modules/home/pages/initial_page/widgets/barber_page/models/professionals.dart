import 'dart:convert';

class Professionals {
  String name;
  String photo;

  Professionals({
    required this.name,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
    };
  }

  factory Professionals.fromMap(Map<String, dynamic> map) {
    return Professionals(
      name: map['name'],
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Professionals.fromJson(String source) =>
      Professionals.fromMap(json.decode(source));
}
