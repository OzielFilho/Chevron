import 'package:barbershop/app/core/errors/failure.dart';
import 'package:barbershop/app/core/usecases/usecase.dart';
import 'package:barbershop/app/modules/login/domain/entities/login_informations.dart';
import 'package:barbershop/app/modules/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';

import 'package:equatable/equatable.dart';

class LoginUserWithFirebase implements Usecase<LoginInformation, Params> {
  final LoginRepository repository;

  LoginUserWithFirebase(this.repository);

  @override
  Future<Either<Failure, LoginInformation>> call(Params params) async {
    if (params.email.isNotEmpty || params.password.isNotEmpty) {
      return await repository.login(params.email, params.password);
    }

    return Left(LoginInfoError());
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  const Params({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
