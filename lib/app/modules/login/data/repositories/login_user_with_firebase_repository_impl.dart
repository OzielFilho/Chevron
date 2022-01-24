import 'package:barbershop/app/core/errors/exceptions.dart';
import 'package:barbershop/app/core/errors/failure.dart';
import 'package:barbershop/app/core/network/network_info.dart';
import 'package:barbershop/app/modules/login/data/datasources/login_user_datasource.dart';
import 'package:barbershop/app/modules/login/domain/entities/login_informations.dart';
import 'package:barbershop/app/modules/login/domain/repositories/login_repository.dart';
import 'package:either_dart/either.dart';

class LoginUserWithFirebaseRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginUserDatasource datasource;
  LoginUserWithFirebaseRepositoryImpl(this.networkInfo, this.datasource);

  @override
  Future<Either<Failure, LoginInformation>> login(
      String email, String password) async {
    if (await networkInfo.hasConnection) {
      try {
        final result = await datasource.loginUser(email, password);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionError());
    }
  }
}
