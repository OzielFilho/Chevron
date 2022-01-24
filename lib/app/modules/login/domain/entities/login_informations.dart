import 'package:equatable/equatable.dart';

class LoginInformation extends Equatable {
  final String success;

  const LoginInformation({required this.success});

  @override
  List<Object?> get props => [success];
}
