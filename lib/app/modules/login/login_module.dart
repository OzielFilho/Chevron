import 'package:barbershop/app/core/network/network_info.dart';
import 'package:barbershop/app/core/network/network_info_impl.dart';
import 'package:barbershop/app/modules/home/home_module.dart';
import 'package:barbershop/app/modules/login/data/repositories/login_user_with_firebase_repository_impl.dart';
import 'package:barbershop/app/modules/login/login_controller.dart';
import 'package:barbershop/app/modules/login/presentation/pages/login_page.dart';
import 'package:barbershop/app/modules/login/pages/create_account/create_account_with_firebase_page.dart';
import 'package:barbershop/app/modules/login/pages/create_account/create_account_with_firebase_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/login_user_datasource.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => NetworkInfoImpl(i())),
        Bind((i)=>LoginUserDatasource ()),
        Bind((i) => LoginUserWithFirebaseRepositoryImpl(i(), i())),
        Bind((i) => LoginController()),
        Bind((i) => CreateAccountWithFirebaseController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, _) => const LoginPage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
        ChildRoute('/create',
            child: (_, __) => const CreateAccountWithFirebasePage(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
        ModuleRoute('/home',
            module: HomeModule(),
            transition: TransitionType.leftToRight,
            duration: const Duration(milliseconds: 800)),
      ];
}
