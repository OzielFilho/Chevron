import 'package:barbershop/app/core/errors/failure.dart';
import 'package:barbershop/app/modules/login/domain/entities/login_informations.dart';
import 'package:either_dart/either.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginInformation>> login(
      String email, String password);
}
