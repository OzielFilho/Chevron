import 'package:barbershop/app/modules/login/data/models/login_info_model.dart';

abstract class LoginUserDatasource {
  Future<LoginInfoModel> loginUser(String email, String password);
}
