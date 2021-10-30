import 'dart:convert';

class UserFirebase {
  final String name;
  final String email;
  final String? photo;

  UserFirebase({
    required this.name,
    required this.email,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  factory UserFirebase.fromMap(Map<String, dynamic> map) {
    return UserFirebase(
      name: map['name'],
      email: map['email'],
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFirebase.fromJson(String source) =>
      UserFirebase.fromMap(json.decode(source));
}
