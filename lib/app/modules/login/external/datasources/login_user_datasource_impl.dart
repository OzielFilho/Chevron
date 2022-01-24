import 'package:barbershop/app/core/errors/exceptions.dart';
import 'package:barbershop/app/core/utils/functions/loading/loading_custom.dart';
import 'package:barbershop/app/modules/login/data/datasources/login_user_datasource.dart';
import 'package:barbershop/app/modules/login/data/models/login_info_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUserDatasourceImpl implements LoginUserDatasource {
  final FirebaseAuth auth;

  LoginUserDatasourceImpl(this.auth);
  @override
  Future<LoginInfoModel> loginUser(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user != null);
      return const LoginInfoModel('Sucesso');
    } catch (e) {
      throw ServerException();
    }
  }
}
