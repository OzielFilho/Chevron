import 'package:barbershop/app/core/errors/failure.dart';
import 'package:barbershop/app/modules/login/domain/entities/login_informations.dart';
import 'package:barbershop/app/modules/login/domain/repositories/login_repository.dart';
import 'package:barbershop/app/modules/login/domain/usecases/login_user_with_firebase.dart';
import 'package:either_dart/either.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  LoginUserWithFirebase? sut;
  LoginRepository? repository;

  setUp(() {
    repository = MockLoginRepository();
    sut = LoginUserWithFirebase(repository!);
  });
  var tLogin = Params(
      email: faker.internet.email(), password: faker.internet.password());
  var loginInfo = const LoginInformation(success: 'Ok');

  test('Deve retornar um login information se tudo estiver correto', () async {
    when(() => repository!.login(any(), any()))
        .thenAnswer((_) async => Right(loginInfo));

    final result = await sut!(tLogin);

    expect(result.right, loginInfo);
    verify(() => repository!.login(tLogin.email, tLogin.password));
    verifyNoMoreInteractions(repository);
  });

  test('Deve retornar uma Failure login info alguma informação estiver errada',
      () async {
    when(() => repository!.login(any(), any()))
        .thenAnswer((_) async => Left(LoginInfoError()));

    final result = await sut!(const Params(email: '', password: ''));

    expect(result.left, LoginInfoError());
  });
}
