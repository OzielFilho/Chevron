import 'dart:convert';

import 'package:barbershop/app/modules/login/domain/entities/login_informations.dart';

class LoginInfoModel extends LoginInformation {
  final String success;
  const LoginInfoModel(
    this.success,
  ) : super(success: success);

  Map<String, dynamic> toMap() {
    return {
      'success': success,
    };
  }

  factory LoginInfoModel.fromMap(Map<String, dynamic> map) {
    return LoginInfoModel(
      map['success'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginInfoModel.fromJson(String source) =>
      LoginInfoModel.fromMap(json.decode(source));
}
